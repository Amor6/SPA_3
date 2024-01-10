FROM python:3.11

WORKDIR /code

COPY requirements.txt /code/requirements.txt

RUN pip install -r /code/requirements.txt

ENV PIP_ROOT_USER_ACTION=ignore

COPY . .

CMD ["python", "manage.py", "runserver"]