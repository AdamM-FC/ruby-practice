require 'kafka'

seed_brokers = ['localhost:9092']
client = Kafka.new(seed_brokers)

topic = 'random_topic'
records = client.fetch_messages topic: topic,
                                partition: 0,
                                offset: :earliest
records.each do |record|
  puts record.value
end

client.close
