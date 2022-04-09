FROM python:3.8-slim-buster

WORKDIR /api-email/

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONBUFFERED 1

# install system dependencies
RUN apt-get update \
    && apt-get -y install netcat gcc postgresql \
    && apt-get clean

# install python dependencies
RUN pip install --upgrade pip

RUN apt-get clean && apt-get autoremove

RUN ls -a

RUN pip freeze > requirements.txt
RUN pip install -r requirements.txt

COPY . /api-email/src/
