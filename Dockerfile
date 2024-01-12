FROM python:3.11

WORKDIR /code

RUN pip install --upgrade pip

COPY requirements.txt .

RUN pip install -r requirements.txt

ENV PIP_ROOT_USER_ACTION=ignore

COPY . .

CMD ["python", "manage.py", "runserver"]