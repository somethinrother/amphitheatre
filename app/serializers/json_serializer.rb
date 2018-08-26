# This class will help in the serialization of JSON data
class JsonSerializer < JSONAPI::ResourceSerializer
  def self.provide_hash(resource, model)
    serializer = JsonSerializer.new(resource)
    serializer.serialize_to_hash(resource.new(model, nil))
  end
end
