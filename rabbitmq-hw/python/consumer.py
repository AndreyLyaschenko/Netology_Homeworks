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

method, properties, body = channel.basic_get(queue="hello", auto_ack=False)

if method:
    print("Получено сообщение:", body.decode())
    channel.basic_ack(delivery_tag=method.delivery_tag)
else:
    print("Очередь пуста")

connection.close()