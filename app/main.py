from fastapi import FastAPI
from app.api import categories, books
from app.db.models import Base
from app.db.db import engine

app = FastAPI(title="Books API", description="API для книг и категорий", version="1.0")

app.include_router(categories.router)
app.include_router(books.router)

@app.get("/health")
def health_check():
    return {"status": "ok", "message": "API работает!"}

Base.metadata.create_all(bind=engine)
