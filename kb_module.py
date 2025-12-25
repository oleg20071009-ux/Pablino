from yandex_cloud_ml_sdk import YCloudML
from dotenv import load_dotenv
import os
import time

load_dotenv()

class YandexKBUpdater:
    def __init__(self):
        self.sdk = YCloudML(
            folder_id=os.getenv("YANDEX_FOLDER_ID"),
            auth=os.getenv("YANDEX_API_KEY")
        )
        self.assistant_id = os.getenv("YANDEX_ASSISTANT_ID")

    def update_kb(self, file_path):
        print("Загрузка файла в Yandex AI Studio...")
        uploaded = self.sdk.files.upload(file_path)
        print(f"Файл загружен, ID: {uploaded.id}")

        print("Создание поискового индекса (отложенно)...")
        operation = self.sdk.search_indexes.create_deferred([uploaded])
        print("Ожидание завершения индексации...")
        search_index = operation.wait()
        print(f"Индекс создан, ID: {search_index.id}")

        print("Подключение индекса к ассистенту как инструмент поиска...")
        tool = self.sdk.tools.search_index(search_index)
        assistant = self.sdk.assistants.get(self.assistant_id)
        assistant.update(tools=[tool])
        print("База знаний успешно обновлена и подключена!")

