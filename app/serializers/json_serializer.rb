class JsonSerializer < JSONAPI::ResourceSerializer
  def self.provide_hash(resource, model)
    serializer = JsonSerializer.new(resource)
    serializer.serialize_to_hash(resource.new(model, nil))
  end
end
