FROM python:3.12-alpine

RUN pip install --upgrade pip

WORKDIR /app

COPY app.py .

RUN pip install flask

EXPOSE 8080

CMD ["python3", "app.py"]
