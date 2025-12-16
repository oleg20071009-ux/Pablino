from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from app.db.db import Base, DATABASE_URL
from app.db.crud import create_category, create_book
from app.db.models import Category, Book
# Создаём все таблицы
engine = create_engine(DATABASE_URL)
Base.metadata.create_all(bind=engine)
SessionLocal = sessionmaker(bind=engine)
db = SessionLocal()

# Добавляем категории
fantasy = create_category(db, "Фэнтези")
detective = create_category(db, "Детектив")
# Добавляем книги
create_book(db, "Гарри Поттер и Философский камень", "Первая книга о мальчике-волшебнике", 890.0, "", fantasy.id)
create_book(db, "Властелин колец", "Эпическая сага о кольце всевластья", 1490.0, "", fantasy.id)
create_book(db, "Убийство в Восточном экспрессе", "Классический детектив Агаты Кристи", 650.0, "", detective.id)
create_book(db, "Девушка с татуировкой дракона", "Шведский триллер", 790.0, "", detective.id)
print("База данных успешно инициализирована!")
print("Категории и книги добавлены.")
db.close()
