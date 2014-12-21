#encoding: utf-8

require 'multi_json'

module HH

  # Define HTTP methods
  module Request

    # Perform an HTTP GET request
    def get(path, params={})
      request(path, params)
    end

    private

      def request(path, params) # :nodoc:
        response = connection.get do |request|
          request.url(path, params)
        end
        MultiJson.load(response.body, symbolize_keys: true)
      end

  end #Request
end #HH