require 'kafka'
require 'json'

topic = 'random_topic'

seed_brokers = ['localhost:9092']
client = Kafka.new(seed_brokers)

producer = client.producer
producer.produce('testing', topic: topic)
producer.deliver_messages
producer.shutdown

client.close
