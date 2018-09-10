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

    def successful_post
      access_string = 'successful_post.' + @model_name
      I18n.t('json_skeletons.' + access_string)
    end

    def successful_put(model_id)
      access_string = 'successful_put.' + @model_name
      I18n.t('json_skeletons.' + access_string, id: model_id)
    end
  end
end
