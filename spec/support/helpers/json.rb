module Helpers
  class JSON
    attr_accessor :model_name, :attributes, :has_relationship, :attr_access_string, :relationship_access_string

    def initialize(model_name, attributes, has_relationship)
      @model_name = model_name
      @attributes = make_attribute_hash(attributes)
      @has_relationship = has_relationship
    end

    def json_headers
      {
        "ACCEPT": "application/vnd.api+json",
        "CONTENT_TYPE": "application/vnd.api+json"
      }
    end

    def build_test_attributes
      model_name_string = @model_name.to_s.downcase
      @attr_access_string = 'test_data.json_attribute_skeletons' + ".#{model_name_string}"
      return model_json_with_relationships(model_name_string) if @has_relationship
      I18n.t(@attr_access_string)
    end

    private

    def model_json_with_relationships(model_name_string)
      @relationship_access_string = 'test_data.json_relationship_skeletons' + ".#{model_name_string}"
      I18n.t(@attr_access_string, attrs: @attributes, relationships: I18n.t(@relationship_access_string))
    end

    def make_attribute_hash(attributes)
      fields = @model_name.column_names
      fields.map do |field|
        attribute_hash = {}
        symbol = field.to_sym
        attribute_hash[symbol] = attributes[symbol] if attributes.keys.include?(symbol)
      end
    end
  end
end
