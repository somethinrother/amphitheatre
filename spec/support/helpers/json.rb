module Helpers
  class JSON
    attr_accessor :model_name, :attributes, :relationship_data, :attr_access_string, :relationship_access_string

    def initialize(model_name, attributes, relationship_data = nil)
      @model_name = model_name
      @attributes = {}
      make_attribute_hash(attributes)
      @relationship_data = relationship_data
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
      return model_json_with_relationships(model_name_string) if @relationship_data
      I18n.t(@attr_access_string, attrs: @attributes)
    end

    private

    def model_json_with_relationships(model_name_string)
      @relationship_access_string = 'test_data.json_relationship_skeletons' + ".#{model_name_string}"
      relationship = I18n.t(@relationship_access_string, attrs: @relationship_data)
      I18n.t(@attr_access_string, attrs: @attributes, relationships: relationship)
    end

    def make_attribute_hash(attributes)
      fields = @model_name.column_names
      fields.map do |field|
        symbol = field.to_sym
        @attributes[symbol] = attributes[symbol] if attributes.keys.include?(symbol)
      end
    end
  end
end
