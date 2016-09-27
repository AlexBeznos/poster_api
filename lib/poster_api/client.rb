require 'poster_api/http_service'

module PosterApi
  class Client
    include HttpService
    ALLOWED_METHODS = [:get, :post]
    attr_accessor :access_token, :account, :response_format

    def initialize(access_token, account = PosterApi.configuration[:account], response_format = PosterApi.configuration[:response_format])
      @access_token = access_token
      @account = account
      @response_format = response_format
    end

    ALLOWED_METHODS.each do |http_method|
      define_method http_method do |poster_method, params = {}|
        make_request do |req|
          req.access_token = access_token
          req.account = account
          req.poster_method = poster_method
          req.http_method = http_method
          req.params = params
          req.response_format = response_format
        end
      end
    end
  end
end
