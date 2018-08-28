module Helpers
  module JSON
    def self.json_headers
      {
        "ACCEPT": "application/vnd.api+json",
        "CONTENT_TYPE": "application/vnd.api+json"
      }
    end

    def self.build_test_attributes(model_name, relationships = true, attrs_hash = {})
      raise 'Please provide model name as a string' if !model_name.is_a?(String)
      attr_access_string = 'test_data.json_attribute_skeletons' + ".#{model_name}"
      return self.model_json_with_relationships(model_name, attr_access_string) if relationships
      I18n.t(attr_access_string)
    end

    private

    def self.model_json_with_relationships(model_name, attr_access_string)
      relationship_access_string = 'test_data.json_relationship_skeletons' + ".#{model_name}"
      return I18n.t(attr_access_string, relationships: I18n.t(relationship_access_string))
    end

  end
end
