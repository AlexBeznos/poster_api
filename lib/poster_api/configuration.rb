module PosterApi
  class Configuration
    attr_accessor :client_id
    attr_accessor :client_secret
    attr_accessor :account
    attr_accessor :format

    def initialize
      @format = 'json'
    end
  end
end
