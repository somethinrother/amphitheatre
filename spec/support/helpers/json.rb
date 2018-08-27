module Helpers
  module JSON
    def self.json_headers
      {
        "ACCEPT": "application/vnd.api+json",
        "CONTENT_TYPE": "application/vnd.api+json"
      }
    end

    def self.valid_attributes(model_as_downcase_string)
      path_to_data = 'valid_json_attributes.' + model_as_downcase_string
      I18n.t(path_to_data)
    end

    private

    def belongs_to_a_class?(model)
      associations = model.reflections
      belongs_to_class = ActiveRecord::Reflection::BelongsToReflection
      associations.keys.each do |key|
        return true if associations[key].class == belongs_to_class
      end
    end
  end
end
