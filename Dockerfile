FROM tiangolo/uvicorn-gunicorn:python3.8

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

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

RUN cat requirements.txt

COPY . /api-email/

CMD ["uvicorn", "emailapi.server:app", "--host", "0.0.0.0", "--port", "8000"]
