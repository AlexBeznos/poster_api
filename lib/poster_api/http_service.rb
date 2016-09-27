require 'poster_api/http_service/request'

module PosterApi
  module HttpService
    def make_request(&block)
      request = Request.new

      yield request

      request.send
      request.response
    end
  end
end
