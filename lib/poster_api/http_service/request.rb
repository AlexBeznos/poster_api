require 'faraday'
require 'oj'
require 'addressable/uri'
require 'poster_api/http_service/response'

module PosterApi
  module HttpService
    class Request
      attr_accessor :access_token, :account, :poster_method,
                    :http_method, :params, :response, :response_format

      def send
        conn = Faraday.new(server)
        res = conn.send(http_method) do |req|
          if http_method == :post
            req.headers['Content-Type'] = 'application/json'
            req.params = params.to_json
          end

          req.path = path
          req
        end

        @response = Response.new(res.status.to_i, prepared_body(res.body))
      end

      def server
        @server ||= "https://#{account}.joinposter.com"
      end

      def path
        @path ||= prepare_path
      end

      private

      def prepare_path
        uri = Addressable::URI.new
        query_values = {
          format: response_format,
          token: access_token
        }
        query_values = query_values.merge(params) if http_method == :get
        uri.path = "/api/#{poster_method}"
        uri.query_values = query_values
        uri.request_uri
      end

      def prepared_body(body)
        case response_format
        when 'json'
          Oj.load(body)
        when 'xml'
          Hash.from_xml(body)
        end
      end
    end
  end
end
