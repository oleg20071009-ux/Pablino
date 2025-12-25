import os
import asyncio
import logging
from telegram import Update
from telegram.ext import Application, CommandHandler, MessageHandler, filters, ContextTypes
from yandex_cloud_ml_sdk import AsyncYCloudML
from dotenv import load_dotenv

# Настройка логирования
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler("bot.log", encoding="utf-8"),
        logging.StreamHandler()
    ]
)
logger = logging.getLogger(__name__)

load_dotenv()

sdk = AsyncYCloudML(
    folder_id=os.getenv("YANDEX_FOLDER_ID"),
    auth=os.getenv("YANDEX_API_KEY")
)

assistant = None

async def init_assistant():
    global assistant
    try:
        assistant_id = os.getenv("YANDEX_ASSISTANT_ID")
        if not assistant_id:
            raise ValueError("YANDEX_ASSISTANT_ID не указан в .env")
        assistant = await sdk.assistants.get(assistant_id)
        logger.info(f"Ассистент успешно загружен: {assistant.name} (id: {assistant.id})")
    except Exception as e:
        logger.critical("Критическая ошибка при загрузке ассистента: %s", e, exc_info=True)
        raise

async def start(update: Update, context: ContextTypes.DEFAULT_TYPE):
    await update.message.reply_text(
        "Привет! Я бот-помощник по API Bitrix24. Задавай вопросы по документации — отвечу точно и по делу."
    )
    logger.info("Команда /start от пользователя %s", update.effective_user.id)

async def handle_message(update: Update, context: ContextTypes.DEFAULT_TYPE):
    user_message = update.message.text.strip()
    user_id = update.effective_user.id
    username = update.effective_user.username or "Без имени"

    logger.info("Сообщение от %s (id: %s): %s", username, user_id, user_message)

    await update.message.reply_chat_action("typing")

    try:
        # Создаём новый thread
        thread = await sdk.threads.create()
        logger.debug("Создан thread %s", thread.id)

        # Добавляем сообщение пользователя
        await thread.write(user_message)
        logger.debug("Добавлено сообщение пользователя")

        # Запускаем run и ждём результат
        run = await assistant.run(thread)  # Здесь await обязателен!

        logger.debug("Run завершён")

        # Получаем ответ (run — итерируемый объект, обычно 1 альтернатива)
        alternatives = [alt async for alt in run]  # async for для streaming-поддержки

        if not alternatives:
            logger.warning("Нет альтернатив в ответе")
            await update.message.reply_text("Не удалось получить ответ от модели. Попробуйте позже.")
            return

        # Берём текст первой (и обычно единственной) альтернативы
        response_text = alternatives[0].text.strip()

        logger.info("Успешный ответ отправлен пользователю %s", user_id)
        await update.message.reply_text(response_text)

    except asyncio.TimeoutError:
        logger.warning("Таймаут при запросе к Yandex GPT")
        await update.message.reply_text("⏳ Ответ занимает слишком долго. Попробуйте упростить вопрос или позже.")
    except Exception as e:
        logger.error("Неожиданная ошибка в handle_message: %s", e, exc_info=True)
        await update.message.reply_text("Произошла ошибка при обработке запроса. Попробуйте позже.")

async def main():
    await init_assistant()

    app = Application.builder().token(os.getenv("TELEGRAM_TOKEN")).build()

    app.add_handler(CommandHandler("start", start))
    app.add_handler(MessageHandler(filters.TEXT & ~filters.COMMAND, handle_message))

    async def error_handler(update: object, context: ContextTypes.DEFAULT_TYPE):
        logger.error("Исключение в Telegram обработчике: %s", context.error, exc_info=True)
        if isinstance(update, Update) and update.effective_message:
            await update.effective_message.reply_text("Произошла внутренняя ошибка бота. Администратор уведомлён.")

    app.add_error_handler(error_handler)

    logger.info("Бот запущен! Нажми Ctrl+C для остановки.")
    await app.initialize()
    await app.start()
    await app.updater.start_polling()
    await asyncio.Event().wait()

if __name__ == '__main__':
    try:
        asyncio.run(main())
    except KeyboardInterrupt:
        logger.info("Бот остановлен пользователем")
    except Exception as e:
        logger.critical("Критическая ошибка при запуске: %s", e, exc_info=True)