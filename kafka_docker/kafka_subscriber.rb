# frozen_string_literal: true
require 'kafka'

topic = 'random_topic'
seed_brokers = ['localhost:9092']
kafka = Kafka.new(seed_brokers)

consumer = kafka.consumer(group_id: 'my-consumer')
consumer.subscribe(topic)
consumer.commit_offsets
consumer.each_message do |message|
  puts message.topic
  puts message.value
end
