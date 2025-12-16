sudo apt install python3
sudo apt install python3-pip
sudo add-apt-repository universe
sudo apt update
sudo apt install python3-pip
python3 -version
python3 --version
pip3 --version
sudo apt install git
git config --global user.name Pablito
git config --global user.email oleg20071009@gmail.com
mkdir -p
mkdir --p
mkdir -p /project123/Pablito
mkdir -p /PROJECT123/Pablito
mkdir -p project123/Pablito
cd project123/Pablito
git clone https://github.com/oleg20071009-ux/Pablito.git
cd Pablito
cd /Pablito
clear
git clone https://github.com/oleg20071009-ux/Pablito.git
git clone https://github.com/oleg20071009-ux/Pablito.git.
cd ~/Project123/Pablito
mkdir -p app examples 
touch app/init.py app/main.py requirements.txt .gitignore
echo 'print("Hello, World!")' > app/main.py
echo -e "pycache\n.venv\n*.pyc\n.env" > .gitignore
python3 app/main.py
git add .
git commit -m "первый коммит"
git push origin main
wsl.exe --install
wsl.exe --install Ubuntu
wsl.exe --list --online
wsl.exe --install Ubuntu
wsl.exe --list --verbose
sudo apt install postgresql
sudo service postgresql start
sudo -u postgres psql
sudo service postgresql start
[200~sudo service PostgreSQL
sudo service postgresql start
sudo service postgresql start
sudo systemct1 status postresq1
sudo -u postgres psql
psql -U octagon -h localhost -d postgres 
python3 -m venv venv
sudo apt update
sudo apt install python3-venv python3-pip -y
rm -rf venv
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip setuptools wheel
pip install psycopg[binary,pool]
cat >requirements.txt <<EOF
SQLAlchemy
psycopg2-binary
python-dotenv
EOF

pip install --upgrade pip
pip install -r requirements.txt
pip freeze > requirements.txt
pip list
cat > .gitignore << 'EOF'
#Виртуальное окружение
venv/
.venv/
env/
ENV/

#Python кэш
__pycache__/
*.ру[cod]
*$ру.class
*.рус
*.руо
*.pyd
.Python
pip-log.txt
pip-delete-this-directory.txt
.pytest_cache
.coverage
coverage.xml
htmlcov/

# VS Code
.vscode/
!.vscode/setting.json
!.vscode/tasks.json
!.vscode/launch.json
!.vscode/extensions.json

#Файлы с секретами
.env
.env.local
.env.*.local

#База данных и миграции
*.db
*.sqlite3
instance/

# Логи
*.log
EOF

cat > .env << 'EOF'
DB_HOST=localhost
DB_PORT=5432
DB_NAME=octagon_db
DB_USER=octagon
DB_PASSWORD=12345
EOF

ls -la .gitignore .env
cat .gitignore | head -n 10
cat .env
mkdir -p add/db
touch app/db/__init__.ру
touch app/db/__init__.py
cat /dev/null > app/db/__init__.py
mkdir -p add/db
touch app/db/__init__.py
mkdir -p app/db
touch app/db/__init__.ру
cat > app/db/db.py << 'EOF'
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, DeclarativeBase
from dotenv import load_dotenv
import os

load_dotenv()

DATABASE_URL = f"postgresql://{os.getenv('DB_USER')}:{os.getenv('DB_PASSWORD')}@{os.getenv('DB_HOST')}:{os.getenv('DB_PORT')}/{os.getenv('DB_NAME')}"

engine = create_engine(DATABASE_URL, echo=False)

SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

class Base(DeclarativeB

EOF

cat > app/db/db.py << 'EOF'
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, DeclarativeBase
from dotenv import load_dotenv
import os
load_dotenv()
DATABASE_URL = f"postgresql://{os.getenv('DB_USER')}:{os.getenv('DB_PASSWORD')}@{os.getenv('DB_HOST')}:{os.getenv('DB_PORT')}/{os.getenv('DB_NAME')}"
engine = create_engine(DATABASE_URL, echo=False)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
class Base(DeclarativeBase):
    pass
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
EOF

cat > app/db/models.py << 'EOF'
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
EOF

python app/init_db.py
python3 app/init_db.py
mkdir -p app/db
touch app/db/__init__.py
cat > app/db/db.py << 'EOF'
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, DeclarativeBase
from dotenv import load_dotenv
import os

load_dotenv()

DATABASE_URL = f"postgresql://{os.getenv('DB_USER')}:{os.getenv('DB_PASSWORD')}@{os.getenv('DB_HOST')}:{os.getenv('DB_PORT')}/{os.getenv('DB_NAME')}"

engine = create_engine(DATABASE_URL, echo=False)

SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

class Base(DeclarativeBase):
    pass

def get_db():
    db = SessionLoc

pip list
psql -U octagon -h localhost -d postgres
source venv/bin/activate
python app/init_db.py
mkdir -p app/db
touch app/db/__init__.py
cat > app/db/db.py << 'EOF'
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, DeclarativeBase
from dotenv import load_dotenv
import os
load_dotenv()
DATABASE_URL = f"postgresql://{os.getenv('DB_USER')}:{os.getenv('DB_PASSWORD')}@{os.getenv('DB_HOST')}:{os.getenv('DB_PORT')}/{os.getenv('DB_NAME')}"
engine = create_engine(DATABASE_URL, echo=False)

SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

class Base(DeclarativeBase):
    pass

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
EOF

cat > app/db/models.py << 'EOF'
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
EOF

cat > app/db/crud.py << 'EOF'
from sqlalchemy.orm import Session
from .models import Category, Book

# === Categories ===
def create_category(db: Session, title: str):
    db_category = Category(title=title)
    db.add(db_category)
    db.commit()
    db.refresh(db_category)
    return db_category

def get_category(db: Session, category_id: int):
    return db.query(Category).filter(Category.id == category_id).first()

def get_categories(db: Session):
    return db.query(Category).all()
# === Books ===
def create_book(db: Session, title: str, description: str, price: float, url: str, category_id: int):
    db_book = Book(title=title, description=description, price=price, url=url, category_id=category_id)
    db.add(db_book)
    db.commit()
    db.refresh(db_book)
    return db_book
def get_books(db: Session):
    return db.query(Book).all()

def get_books_by_category(db: Session, category_id: int):
    return db.query(Book).filter(Book.category_id == category_id).all()
EOF

cat > app/init_db.py << 'EOF'
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
EOF

cat > app/init_db.py << 'EOF'
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
# Добавляем книги
create_book(db, "Гарри Поттер и Философский камень", "Первая книга о мальчике-волшебнике", 890.0, "", fantasy.id)
create_book(db, "Властелин колец", "Эпическая сага о кольце всевластья", 1490.0, "", fantasy.id)
create_book(db, "Убийство в Восточном экспрессе", "Классический детектив Агаты Кристи", 650.0, "", detective.id)
create_book(db, "Девушка с татуировкой дракона", "Шведский триллер", 790.0, "", detective.id)
print("База данных успешно инициализирована!")
print("Категории и книги добавлены.")
db.close()
EOF

cat > app/main.py << 'EOF' 
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
EOF

cat > app/main.py << 'EOF'
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
EOF

python app/init_db.py
python add/init_db.py
python app/init_db.py
python -m app.init_db
python -m app.main
pip --version
ls -la app/db/__init__.py
python main.py
python
python app/main.py
python3 app/main.py
python app/init_db.py
python3 app/init_db.py
sudo apt update && sudo apt upgrade -y 
sudo apt install postgresql postgresql-contrib -y
sudo systemctl status postgresql
sudo -u postgres psql
psql -U octagon -h localhost -d postgres
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip setuptools wheel
pip install psycopg[binary,pool]
pip install sqlalchemy alembic python-dotenv fastapi uvicorn[standart] pydantic
pip freeze > requirments.txt
python3 -m venv venv
source venv/bin/activate
cat > requirements.txt << EOF
SQLAlchemy
psycopg2-binary
python-dotenv
EOF

pip install --upgrade pip
pip install -r requirements.txt
pip freeze > requirements.txt
pip list
cat > .gitignore << 'EOF'
#Виртуальное окружение
venv/
.venv/
env/
ENV

#Python кэш
__pycache__/
*.py[cod]
*$py.class
*.pyc
*.pyo
*.pyd
.Python
pip-log.txt
pip-delete-this-directory.txt
.pytest_cache
.coverage
coverage.xml
htmlcov/

#VS Code
.vscode/
!.vscode/settings.json
!.vscode/tasks.json
!.vscode/launch.json
!.vscode/extensions.json

# Файлы с секретами
.env
.env.local
.env.*.local

# Базы данных и миграции
*.db
*.sqlite3
instance/

# Логи
*.sqlite3
instance/

#Логи
*.log
EOF

cat > .env << 'EOF'
DB_HOST=localhost
DB_PORT=5432
DB_NAME=octagon_db
DB_USER=octagon
DB_PASSWORD=12345
EOF

ls -la .gitignore .env
cat .gitignore 
cat .gitignore | head -n 10
cat .env
mkdir -p app/db
touch app/db/__init__.py
cat > app/db/db.py << 'EOF'
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, DeclarativeBase
from dotenv import load_dotenv
import os
load_dotenv()
DATABASE_URL = f"postgresql://{os.getenv('DB_USER')}:{os.getenv('DB_PASSWORD')}@{os.getenv('DB_HOST')}:{os.getenv('DB_PORT')}/{os.getenv('DB_NAME')}"
engine = create_engine(DATABASE_URL, echo=False)

SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

class Base(DeclarativeBase):
    pass
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
EOF

cat > app/db/models.py << 'EOF'
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
EOF

cat > app/db/crud.py << 'EOF'
from sqlalchemy.orm import Session
from .models import Category, Book
# === Categories ===
def create_category(db: Session, title: str):
    db_category = Category(title=title)
    db.add(db_category)
    db.commit()
    db.refresh(db_category)
    return db_category
def get_category(db: Session, category_id: int):
    return db.query(Category).filter(Category.id == category_id).first()

def get_categories(db: Session):
    return db.query(Category).all()
# === Books ===
def create_book(db: Session, title: str, description: str, price: float, url: str, category_id: int):
    db_book = Book(title=title, description=description, price=price, url=url, category_id=category_id)
    db.add(db_book)
db.commit()
    db.refresh(db_book)
    return db_book
def get_books(db: Session):
    return db.query(Book).all()

def get_books_by_category(db: Session, category_id: int):
    return db.query(Book).filter(Book.category_id == category_id).all()
EOF

cat > app/init_db.py << 'EOF'
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
EOF

cat > app/main.py << 'EOF'
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
EOF

python app/init_db.py
cd app
python init_db.py
cd ..
python app/init_db.py
ls -la app/db/__init__.py
python -m app.indit_db
python -m app.main
ls -la app/db/__init__.py
source venv/bin/activate
python app/init_db.py
python app/main.py
ls -la app/db/__init__.py
source venv/bin/activate
touch app/db/__init__.py
ls -la app/db/
python -m app.intit.db
python -m app.main
python -m app.intit_db
touch __init__.py
python -m app.intit_db
python3 -m app.intit_db
ls -la app/db/
-mkdir -p app/db
mkdir
mkdir -p app/db
touch app/db/__init__.py
cat > app/db/db.py << 'EOF'
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, DeclarativeBase
from dotenv import load_dotenv
import os

load_dotenv()
DATABASE_URL = f"postgresql://{os.getenv('DB_USER')}:{os.getenv('DB_PASSWORD')}@{os.getenv('DB_HOST')}:{os.getenv('DB_PORT')}/{os.getenv('DB_NAME')}"
engine = create_engine(DATABASE_URL, echo=False)

SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

class Base(DeclarativeBase):
    pass

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
EOF

cat > app/db/models.py << 'EOF'
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
EOF

cat > app/db/crud.py << 'EOF'
from sqlalchemy.orm import Session
from .models import Category, Book
# === Categories ===
def create_category(db: Session, title: str):
    db_category = Category(title=title)
    db.add(db_category)
    db.commit()
    db.refresh(db_category)
    return db_category
def get_category(db: Session, category_id: int):
    return db.query(Category).filter(Category.id == category_id).first()

def get_categories(db: Session):
    return db.query(Category).all()
# === Books ===
def create_book(db: Session, title: str, description: str, price: float, url: str, category_id: int):
    db_book = Book(title=title, description=description, price=price, url=url, category_id=category_id)
    db.add(db_book)
    db.commit()
    db.refresh(db_book)
    return db_book
def get_books(db: Session):
    return db.query(Book).all()

def get_books_by_category(db: Session, category_id: int):
    return db.query(Book).filter(Book.category_id == category_id).all()
EOF

python app/init_db.py
python app/main.py
ls -la app/db/__init__.py
mkdir -p app/db && touch app/db/__init__.py && cat > app/db/db.py << 'EOF'
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, DeclarativeBase
from dotenv import load_dotenv
import os
DATABASE_URL = f"postgresql://{os.getenv('DB_USER')}:{os.getenv('DB_PASSWORD')}@{os.getenv('DB_HOST')}:{os.getenv('DB_PORT')}/{os.getenv('DB_NAME')}"
engine = create_engine(DATABASE_URL, echo=False)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

class Base(DeclarativeBase):
    pass

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
EOF

python -m app.intit_db
pip --version
python main.py
touch app/db/__init__.py
python main.py
python app/main.py
source venv/bin/activate
python -m app.main
python app/init_db.py
python app/main.py
ls -la .gitignore .env
cat .gitignore | head -n 10
python -m app.main
clear
psql -h localhost -U postgres -d mydatabase
psql -U octagon -h localhost -d octagon_db
sudo -u postgres psql
python -m app.init_db
cat .env
python -c "from dotenv import load_dotenv, find_dotenv; load_dotenv(); import os;print('USER:', os.getenv('DB_USER')); print('PASS:', os.getenv('DB_PASSWORD'))"
python -m app.init_db
cat > app/db/db.py << 'EOF'
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, DeclarativeBase
from dotenv import load_dotenv
import os
load_dotenv(dotenv_path="Pablino/.env")
user = os.getenv("DB_USER")
password = os.getenv("DB_PASSWORD")
host = os.getenv("DB_HOST", "localhost")
port = os.getenv("DB_PORT", "5432")
db_name = os.getenv("DB_NAME")
if not all([user, password, db_name]):
    raise EnvironmentError("Не удалось загрузить переменные из .env файла! Проверьте содержимое .env")
DATABASE_URL = f"postgresql://{user}:{password}@{host}:{port}/{db_name}"

engine = create_engine(DATABASE_URL, echo=False)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

class Base(DeclarativeBase):
    pass

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
EOF

python -m app.init_db
cat > app/db/db.py << 'EOF'
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, DeclarativeBase
from dotenv import load_dotenv
import os
load_dotenv()  # ← вот эта строка теперь правильная
user = os.getenv("DB_USER")
password = os.getenv("DB_PASSWORD")
host = os.getenv("DB_HOST", "localhost")
port = os.getenv("DB_PORT", "5432")
db_name = os.getenv("DB_NAME", "octagon_db")
if not user or not password:
    raise EnvironmentError(f"Не загружены переменные из .env!\n"
                          f"DB_USER={user}\nDB_PASSWORD={'***' if password else None}\n"
                          f"Текущая директория: {os.getcwd()}")
DATABASE_URL = f"postgresql://{user}:{password}@{host}:{port}/{db_name}"

engine = create_engine(DATABASE_URL, echo=False)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
class Base(DeclarativeBase):
    pass

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
EOF

python -m app.init_db
sudo -u postgres psql
sudo -u postgres createdb octagon_db -0 octagon
sudo -u postgres createdb octagon_db -O octagon
python -m app.init_db
python -m app.main
echo "# Pablino" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/oleg20071009-ux/Pablino.git
git push -u origin main
git add .
git commit -m "Added FastAPI with CRUD endpoints"
git push origin main
git remote set-url origin https://github.com/oleg20071009-ux/Pablino.git
git push -u origin main
git lfs install
sudo apt update
sudo apt install git-lfs
git lfs track ".vscode-server/bin/bf9252a2fb45be6893dd8870c0bf37e2e1766d61/node"
git rm --cached .vscode-server/bin/bf9252a2fb45be6893dd8870c0bf37e2e1766d61/node
git add .vscode-server/bin/bf9252a2fb45be6893dd8870c0bf37e2e1766d61/node
git commit -m "Перевёл большой файл на LFS"
git push -u origin main
git rm -r --cached .vscode-server
git commit -m "Remove vscode-server"
git push -u origin main --force
sudo apt install git-filter-repo
git filter-repo --version
git filter-repo --path .vscode-server/ --invert-paths
.vscode-server/
git filter-repo --force --path .vscode-server/ --invert-paths
git rm -r --cached .vscode-server
git filter-repo --path .vscode-server/ --invert-paths
.vscode-server/
git rm -r --cached .vscode-server
git filter-repo --path .vscode-server/ --invert-paths
.vscode-server/
clear
python -m app.init_db
sudo -u postgres createdb octagon_db -O octagon
python -m app.init_db
python -m app.main
clear
git init 
git add .
git commit -m "Initial commit"
git status
git remote remove origin
git remove remove https://github.com/oleg20071009-ux/Pablino.git
git remote remove origin https://github.com/oleg20071009-ux/Pablino.git
gir remote remove Pablino 
git remote remove Pablino
git remove remove Pablino git: 'remove' is not a git command. See 'git --help'.
The most similar command is
(venv) pablino@DESKTOP-RT8DGR2:~$ git remote remove origin https://github.com/oleg20071009-ux/Pablino.git
usage: git remote remove <name>
git remote remove Pablino https://github.com/oleg20071009-ux/Pablino.git
rm -rf .git
get status
git  status
.git status
pwd
cd /home/pablino
git remote remove origin
ls -a
git remove add origin https://github.com/oleg20071009-ux/Pablino.git
git remote add origin https://github.com/oleg20071009-ux/Pablino.git
\q
/q
deactivate
git remote add origin (venv) pablino@DESKTOP-RT8DGR2:~$ 
git remote add origin https://github.com/oleg20071009-ux/Pablino.git
cd ~/Pablino
pwd
cd $(find /home/pablino -type d -name "app" 2>/dev/null | head -1)/.. && pwd && git status
find /home/pablino -name "requirements.txt" 2>/dev/null | head -5
cd /home/pablino/Project123/Pablito
git init
git add .
git commit -m "feat: полный проект с PostgreSQL, SQLAlchemy, моделями, CRUD и заполненной БД"
git remote -v
git remote add origin https://github.com/oleg20071009-ux/Pablino.git || echo "remote уже существует — ок"
git branch -M main
git push -u origin main
git remote add origin https://github.com/oleg20071009-ux/Pablino.git
git push -u origin main
git remote add origin https://github.com/oleg20071009-ux/Pablino.git || echo "remote уже существует — ок"
git branch -M main
git push -u origin main
git remote add origin https://github.com/oleg20071009-ux/Pablino.git
