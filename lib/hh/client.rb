#encoding: utf-8

module HH
  class Client
    include API
    include Request

    # @param options [Hash]
    def default_middleware(options={})
      Proc.new do |conn|
        conn.request  :multipart
        conn.adapter  :net_http

        conn.response :logger if ENV['DEBUG']
      end
    end

    @stack = nil

    # Exposes middleware builder to facilitate custom stacks
    # @param options [Hash]
    # @return [Faraday::RackBuilder]
    def stack(options={}, &block)
      @stack ||= begin
        if block_given?
          Faraday::RackBuilder.new(&block)
        else
          Faraday::RackBuilder.new(&default_middleware(options))
        end
      end
    end

    # @param options [Hash]
    # @return [Faraday::Connection]
    def connection(options={})
      conn_options = default_options(options)
      puts "OPTIONS:#{conn_options.inspect}" if ENV['DEBUG']

      @connection ||= Faraday.new(conn_options.merge(builder: stack(options)))
    end

    private

      # @param options [Hash]
      # @return [Hash]
      def default_options(options={})
        {
          headers: {
            accept:         "application/json;q=0.1",
            accept_charset: "utf-8",
            user_agent:     "Ruby gem HH version #{HH::VERSION}",
            content_type:   "application/json"
          },
          url: API_URL
        }.merge(options)
      end
  end
end #HH