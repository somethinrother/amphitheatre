module Helpers
  class JSON
    attr_accessor :model_name, :attributes, :relationships, :access_string

    def initialize(model_name)
      @model_name = model_name
    end

    def json_headers
      {
        "ACCEPT": "application/vnd.api+json",
        "CONTENT_TYPE": "application/vnd.api+json"
      }
    end

    def i18n_utility(desired_section)
      I18n.t('json_skeletons.' + desired_section)
    end

    def successful_post
      access_string = 'successful_post.' + @model_name
      i18n_utility(access_string)
    end
  end
end
