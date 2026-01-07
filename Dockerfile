FROM python:3.12-slim as builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

FROMpython:3.12-slim
WORKDIR /app
COPY --from=builder /install /usr/local
COPY ./app /app/app

RUN useradd - devops_user
USER devops_user

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

