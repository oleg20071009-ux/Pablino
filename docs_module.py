from selenium import webdriver
from selenium.webdriver.chrome.service import Service as ChromeService
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from webdriver_manager.chrome import ChromeDriverManager
import time
import os

class BitrixDocsParser:
    def __init__(self):
        options = Options()
        options.add_argument("--headless")
        options.add_argument("--no-sandbox")
        options.add_argument("--disable-dev-shm-usage")
        options.add_argument("--disable-gpu")
        options.add_argument("--window-size=1920,1080")
        options.add_argument("--disable-extensions")
        options.add_argument("--disable-infobars")
        # Добавляем эти опции для лучшей совместимости с JS-сайтами
        options.add_argument("--disable-blink-features=AutomationControlled")
        options.add_experimental_option("excludeSwitches", ["enable-automation"])
        options.add_experimental_option("useAutomationExtension", False)

        service = ChromeService(ChromeDriverManager().install())
        self.driver = webdriver.Chrome(service=service, options=options)
        # Маскируем, что это Selenium
        self.driver.execute_cdp_cmd("Page.addScriptToEvaluateOnNewDocument", {
            "source": """
                Object.defineProperty(navigator, 'webdriver', {
                    get: () => false
                });
            """
        })
        self.output_file = "bitrix24_api_docs.txt"

    def parse_docs(self):
        base_url = "https://apidocs.bitrix24.ru/api-reference/"
        self.driver.get(base_url)
        # Ждём загрузки основного контента
        WebDriverWait(self.driver, 20).until(
            EC.presence_of_element_located((By.CSS_SELECTOR, "main, article, .content, div[class*='doc']"))
        )
        time.sleep(2)  # дополнительная пауза

        all_text = ["Bitrix24 API Documentation - Full Reference\n\n"]
        seen_texts = set()

        # Собираем ссылки глубже
        links = self.driver.find_elements(By.CSS_SELECTOR, "a[href*='/api-reference/']")
        urls = set()
        for link in links:
            href = link.get_attribute("href")
            if href and href.startswith("https://apidocs.bitrix24.ru/api-reference/") and href.endswith(".html"):
                urls.add(href)

        # Добавляем ключевые вручную (на случай, если не все спарсятся)
        important_urls = [
            "https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-add.html",
            "https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-list.html",
            "https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-update.html",
            "https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-get.html",
            "https://apidocs.bitrix24.ru/api-reference/crm/deals/crm-deal-fields.html",
            "https://apidocs.bitrix24.ru/api-reference/crm/index.html",
            "https://apidocs.bitrix24.ru/api-reference/crm/deals/index.html",
        ]
        urls.update(important_urls)

        for url in sorted(urls):
            try:
                self.driver.get(url)
                # Ждём появления основного контента (ищем таблицы, код или текст)
                WebDriverWait(self.driver, 20).until(
                    EC.presence_of_element_located((By.CSS_SELECTOR, "table, pre, code, p, div[class*='method']"))
                )
                time.sleep(3)  # даём JS дорисовать всё

                title = self.driver.find_element(By.TAG_NAME, "h1").text.strip()
                all_text.append(f"\n{'='*80}\n{title}\nURL: {url}\n{'='*80}\n")

                # Лучше собирать текст по блокам, а не по всем элементам
                content_blocks = self.driver.find_elements(By.CSS_SELECTOR, "main p, main li, main pre, main code, main table, article p, article li")
                for block in content_blocks:
                    text = block.text.strip()
                    if text and len(text) > 5 and text not in seen_texts:
                        all_text.append(text + "\n\n")
                        seen_texts.add(text)

                # Дополнительно: если есть таблицы параметров — они важны
                tables = self.driver.find_elements(By.TAG_NAME, "table")
                for table in tables:
                    all_text.append(table.text + "\n\n")

                print(f"Спарсили: {title} ({url})")
            except Exception as e:
                print(f"Ошибка на {url}: {e}")

        with open(self.output_file, "w", encoding="utf-8") as f:
            f.write("\n".join(all_text))

        size = os.path.getsize(self.output_file) / 1024
        print(f"Документация сохранена в {self.output_file} ({size:.1f} KB)")
        return self.output_file

    def cleanup(self):
        self.driver.quit()

