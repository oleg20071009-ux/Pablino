from sqlalchemy import Column, Integer, String, Float, ForeignKey
from sqlalchemy.orm import relationship
from .db import Base

class Category(Base):
    __tablename__ = "categories"

    id = Column(Integer, primary_key=True, index=True)
    title = Column(String(100), unique=True, nullable=False)

    books = relationship("Book", back_populates="category")

    def __repr__(self):
        return f"<Category {self.title}>"

class Book(Base):
    __tablename__ = "books"

    id = Column(Integer, primary_key=True, index=True)
    title = Column(String(200), nullable=False)
    description = Column(String(1000))
    price = Column(Float, nullable=False)
    url = Column(String(500), default="")
    category_id = Column(Integer, ForeignKey("categories.id"))

    category = relationship("Category", back_populates="books")

    def __repr__(self):
        return f"<Book {self.title} - {self.price}₽>"