require 'json'
require 'kafka'
require 'logger'
require 'avro'

require_relative 'data/schema.rb'

schema = Avro::Schema.parse schema_json

logger = Logger.new STDOUT, level: :info
seed_brokers = ['localhost:9092']
client = Kafka::Client.new seed_brokers: seed_brokers, logger: logger

topic = 'timezones_avro'
records = client.fetch_messages topic: topic,
                                partition: 0,
                                offset: :earliest

records.map(&:value)

reader = Avro::IO::DatumReader.new schema

deserialize = lambda do |val|
  decoder = Avro::IO::BinaryDecoder.new StringIO.new val
  h = reader.read decoder

  # After deserializing the hash we’ll transform the keys from strings to
  # symbols just to make them more idiomatic to work with in Ruby.
  h.transform_keys(&:to_sym)

  puts h
end

records.map(&:value)
       .map { |rv| deserialize[rv] }
