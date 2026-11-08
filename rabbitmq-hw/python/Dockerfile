FROM python:3.12-slim

WORKDIR /app

COPY packages/pika-1.4.4-py3-none-any.whl /tmp/

RUN pip install --no-cache-dir --no-index \
    /tmp/pika-1.4.4-py3-none-any.whl \
    && rm /tmp/pika-1.4.4-py3-none-any.whl

CMD ["sleep", "infinity"]
