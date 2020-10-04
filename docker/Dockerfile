FROM python:3.8.6-alpine3.12

# Env variables 
ENV FLASK_APP=app
ENV FLASK_ENV=development

# Create app directory
WORKDIR /app

# Install app dependencies
COPY src/requirements.txt ./

RUN pip install -r requirements.txt

# Bundle app source
COPY src /app

# The container listening network ports at runtime.
EXPOSE 80

# Create database.db, follow by start the web application.
CMD python init_db.py && flask run --host=0.0.0.0 --port=80
