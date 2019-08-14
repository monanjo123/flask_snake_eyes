FROM python:3.7.4-alpine
MAINTAINER Mon Anjo Calma <moncalma13@gmail.com>

ENV INSTALL_PATH /snakeeyes
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

CMD gunicorn -b 0.0.0.0:8000 --access-logs - "snakeeyes.app:create_app()"