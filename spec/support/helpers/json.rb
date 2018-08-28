module Helpers
  class JSON
    attr_accessor :model_name, :attributes, :relationships, :attr_access_string

    def initialize(model_name, attributes)
      @model_name = model_name
      @attributes = attributes
      @relationships = relationships
      @attr_access_string = 'test_data.json_skeletons' + ".#{model_name}"
    end

    def json_headers
      {
        "ACCEPT": "application/vnd.api+json",
        "CONTENT_TYPE": "application/vnd.api+json"
      }
    end

    def build_test_attributes
      I18n.t(@attr_access_string, attrs: @attributes)
    end
  end
end
