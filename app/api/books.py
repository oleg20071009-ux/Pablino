from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
from typing import Optional
from app.db import crud
from app.schemas import BookCreate, BookUpdate, BookResponse
from app.db.database import get_db

router = APIRouter(prefix="/books", tags=["books"])

@router.get("/", response_model=list[BookResponse])
def read_books(category_id: Optional[int] = None, db: Session = Depends(get_db)):
    if category_id:
        return crud.get_books_by_category(db, category_id)
    return crud.get_books(db)

@router.get("/{book_id}", response_model=BookResponse)
def read_book(book_id: int, db: Session = Depends(get_db)):
    book = crud.get_book(db, book_id)
    if not book:
        raise HTTPException(status_code=404, detail="Book not found")
    return book

@router.post("/", response_model=BookResponse, status_code=status.HTTP_201_CREATED)
def create_book(book: BookCreate, db: Session = Depends(get_db)):
    if not crud.get_category(db, book.category_id):
        raise HTTPException(status_code=404, detail="Category not found")
    return crud.create_book(db, book)

@router.put("/{book_id}", response_model=BookResponse)
def update_book(book_id: int, book_update: BookUpdate, db: Session = Depends(get_db)):
    if not crud.get_book(db, book_id):
        raise HTTPException(status_code=404, detail="Book not found")
    if book_update.category_id is not None and not crud.get_category(db, book_update.category_id):
        raise HTTPException(status_code=404, detail="Category not found")
    return crud.update_book(db, book_id, book_update)

@router.delete("/{book_id}", status_code=status.HTTP_204_NO_CONTENT)
def delete_book(book_id: int, db: Session = Depends(get_db)):
    if not crud.get_book(db, book_id):
        raise HTTPException(status_code=404, detail="Book not found")
    crud.delete_book(db, book_id)
