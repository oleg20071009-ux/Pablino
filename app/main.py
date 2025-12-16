from sqlalchemy.orm import sessionmaker
from app.db.db import engine, Base
from app.db.models import Category, Book
from app.db.crud import get_categories, get_books
SessionLocal = sessionmaker(bind=engine)
db = SessionLocal()

print("=== Категории ===")
for cat in get_categories(db):
    print(f"{cat.id}. {cat.title}")
print("\n=== Все книги ===")
for book in get_books(db):
    print(f"{book.id}. {book.title} | {book.price}₽ | Категория: {book.category.title}")

db.close()
