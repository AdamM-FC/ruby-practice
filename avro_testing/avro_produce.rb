require 'json'
require 'avro'
require 'avro_turf'
require_relative './example_hashes'

def avro
  AvroTurf.new(schemas_path: 'schemas/')
end

def character_example
  encoded_data = avro.encode(character_hash, schema_name: 'schemas')
  avro.decode(encoded_data, schema_name: 'schemas')
end

def episode_example
  encoded_data = avro.encode(episode_hash, schema_name: 'schemas')
  avro.decode(encoded_data, schema_name: 'schemas')
end

def location_example
  encoded_data = avro.encode(location_hash, schema_name: 'schemas')
  avro.decode(encoded_data, schema_name: 'schemas')
end

p character_example

p episode_example

p location_example
