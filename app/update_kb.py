from docs_module import BitrixDocsParser
from kb_module import YandexKBUpdater

print("Начинаем обновление базы знаний Bitrix24 API...")

parser = BitrixDocsParser()
txt_file = parser.parse_docs()

updater = YandexKBUpdater()
updater.update_kb(txt_file)

print("Готово! Ассистент теперь знает всю документацию Bitrix24.")
print("Можешь протестировать в AI Studio или запустить Telegram-бота.")
