require "poster_api/configuration"
require "poster_api/http_service"
require "poster_api/http_service/request"
require "poster_api/http_service/response"
require "poster_api/client"
require "poster_api/version"

module PosterApi
  class << self
    def configure(&block)
      yield(configuration)
      configuration
    end

    def configuration
      @_configuration ||= Configuration.new
    end
  end
end
