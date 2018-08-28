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
      fetch_data_type + construct_relationships + construct_attributes
    end

    def json_utility(desired_section)
      I18n.t('json_skeletons.general.' + desired_section)
    end

    def fetch_data_type
      data_type_string = @access_string + '.data/type'
      I18n.t(data_type_string)
    end

    def construct_relationships
      relationship_access_string = @access_string + '.relationships'
      relationship_string = json_utility('relationships_starter')
      @relationships.each do |model, id|
        single_relationship = relationship_access_string + ".#{model.to_s}"
        relationship_string += I18n.t(single_relationship, id: id)
      end
      relationship_string += json_utility('relationships_ending')
    end

    def construct_attributes
      attributes_access_string = @access_string + '.attributes'
      attribute_string = json_utility('attributes_starter')
      @attributes.each do |field, value|
        single_attribute = attributes_access_string + ".#{field.to_s}"
        attribute_string += I18n.t(single_attribute, field => value)
      end
      attribute_string += json_utility('attributes_ending')
    end
  end
end
