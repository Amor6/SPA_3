Трекер полезных привычек - бэкенд-часть SPA веб-приложения

Описание

*Настроен CORS.

*Настроена интеграция с Telegram.

*Реализована пагинация (с выводом по 5 привычек на страницу).
*Реализованы валидаторы:

-Исключить одновременный выбор связанной привычки и указания вознаграждения.

-Время выполнения должно быть не больше 120 секунд.

-В связанные привычки могут попадать только привычки с признаком приятной привычки.

-У приятной привычки не может быть вознаграждения или связанной привычки.

-Нельзя выполнять привычку реже, чем 1 раз в 7 дней.

*Описаны права доступа:

-Каждый пользователь имеет доступ только к своим привычкам по механизму CRUD.

-Пользователь может видеть список публичных привычек без возможности их как-то редактировать или удалять.

-Настроена отложенная задача через Celery.

-Имеется список зависимостей.

-Результат проверки Flake8 равен 100%, при исключении миграций.

*Эндпоинты:

-Регистрация и авторизация пользователя

-Список привычек текущего пользователя с пагинацией

-Список публичных привычек

-Создание, редактирование и удаление привычки

Технологии

Python

Django, DRF

JWT, DRF-YASG

PostgreSQL

Celery, Redis

TeleBot

Сущности

Приятные привычки

Неприятные привычки

Пользователь

Для запуска проекта необходимо клонировать репозиторий и создать и активировать виртуальное окружение:

python3 -m venv venv

venv/Scripts/activate - активация на Windows
source venv/bin/activate - активация на Mac и Linux
Установить зависимости:

pip install -r requirements.txt
Для работы с переменными окружениями необходимо создать файл .env и заполнить его согласно файлу .env.sample:

#Secret_key
SECRET_KEY=


#Telegram bot
TELEGRAM_TOKEN=
Выполнить миграции:

python3 manage.py migrate
Для создания администратора запустить команду:

python3 manage.py csu
Для запуска redis:

redis-cli
Для запуска celery:

celery -A config worker --loglevel=info
Для запуска django-celery-beat:

celery -A config beat --loglevel=info
Для запуска приложения:

python3 manage.py runserver
Для тестирования проекта запустить команду:

python3 manage.py test

Запуск проекта в Docker:
Для работы с переменными окружениями необходимо создать файл .env и заполнить его согласно файлу .env.example:

SECRET_KEY=
TELEGRAM_TOKEN=

Для создания образа из Dockerfile и запуска контейнера запустить команду:

docker-compose up --build
или

docker-compose up -d --build

ENV PIP_ROOT_USER_ACTION=ignore