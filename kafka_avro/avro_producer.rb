require 'json'
require 'kafka'
require 'logger'
require 'avro'

require_relative 'data/schema.rb'
require_relative 'data/my_hashes.rb'

schema = Avro::Schema.parse schema_json

writer = Avro::IO::DatumWriter.new schema

serialize = lambda do |h|
  h2 = h.transform_keys(&:to_s)

  buf = StringIO.new
  encoder = Avro::IO::BinaryEncoder.new buf
  writer.write h2, encoder
  buf.string
end

# change this to bad hash and it will avro will return error as json fails to match schema
serialized_hashes = bad_hash.map { |h| serialize[h] }

seed_brokers = ['localhost:9092']
logger = Logger.new STDOUT, level: :info
client = Kafka.new(seed_brokers, logger: logger)

topic = 'timezones_avro'
producer = client.producer

serialized_hashes.each do |sh|
  producer.produce(sh, topic: topic)
end

producer.deliver_messages
producer.shutdown
client.close
