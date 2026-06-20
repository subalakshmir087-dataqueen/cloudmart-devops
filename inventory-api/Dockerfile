FROM python:3.12-alpine
WORKDIR /app
COPY app.py .
RUN pip install flask
EXPOSE 8081
CMD ["python3", "app.py"]
