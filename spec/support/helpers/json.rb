module Helpers
  class JSON
    attr_accessor :model_name, :attributes, :relationships, :access_string

    def initialize(model_name, attributes, relationships)
      @model_name = model_name
      @attributes = attributes
      @relationships = relationships
      @access_string = 'json_skeletons.' + @model_name
    end

    def json_headers
      {
        "ACCEPT": "application/vnd.api+json",
        "CONTENT_TYPE": "application/vnd.api+json"
      }
    end

    def build_test_attributes
      attr_string = @access_string + '.attributes.'
      I18n.t(attr_string, attrs: @attributes)
    end

    def build_test_relationships
      relationship_string = @access_string + '.relationships.'
      I18n.t(relationship_string, attrs: @relationships)
    end

    # I18n Builders

    def build_json
      byebug
      fetch_data_type + construct_relationships + construct_attributes
    end

    def fetch_data_type
      data_type_string = @access_string + '.data/type'
      I18n.t(data_type_string)
    end

    def construct_relationships

    end

    def construct_attributes

    end
  end
end
