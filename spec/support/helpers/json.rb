module Helpers
  class JSON
    attr_accessor :model_name, :attributes, :has_relationship, :attr_access_string, :relationship_access_string

    def initialize(model_name, attributes, has_relationship)
      @model_name = model_name
      @attributes = attributes
      @has_relationship = has_relationship
    end

    def json_headers
      {
        "ACCEPT": "application/vnd.api+json",
        "CONTENT_TYPE": "application/vnd.api+json"
      }
    end

    def build_test_attributes
      raise 'Please provide model name as a string' if !@model_name.is_a?(String)
      @attr_access_string = 'test_data.json_attribute_skeletons' + ".#{@model_name}"
      return model_json_with_relationships if @has_relationship
      I18n.t(@attr_access_string)
    end

    private

    def model_json_with_relationships
      @relationship_access_string = 'test_data.json_relationship_skeletons' + ".#{@model_name}"
      I18n.t(@attr_access_string, attrs: { title: 'boof', description: 'great stuff' }, relationships: I18n.t(@relationship_access_string))
    end
  end
end
