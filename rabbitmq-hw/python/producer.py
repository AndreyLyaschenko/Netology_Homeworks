import os
import pika

credentials = pika.PlainCredentials("netology", "netology123")
connection = pika.BlockingConnection(
    pika.ConnectionParameters(
        host=os.getenv("RABBITMQ_HOST", "rabbitmq1"),
        credentials=credentials
    )
)

channel = connection.channel()
channel.queue_declare(queue="hello", durable=True)

channel.basic_publish(
    exchange="",
    routing_key="hello",
    body="Hello Netology!",
    properties=pika.BasicProperties(delivery_mode=2)
)

print("Сообщение отправлено: Hello Netology!")
connection.close()