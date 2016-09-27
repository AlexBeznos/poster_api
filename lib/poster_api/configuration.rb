module PosterApi
  class Configuration
    attr_accessor :client_id, :client_secret,
                  :account,   :response_format

    def initialize
      @response_format = 'json'
    end

    def [](option)
      self.send(option)
    end
  end
end
