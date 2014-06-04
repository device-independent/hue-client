require 'faraday_middleware'
require 'delegate'

module Hue
  module Client
    class Connection < SimpleDelegator
      def initialize(url, &block)
        @_client = Faraday.new(url, &block)
      end

      # This builds a new connection with sensible defaults
      # provided in the configuration object.
      #
      # @return [Hue::Client::Connection] The connection object
      def self.build_from_configuration(configuration, &block)
        # TODO: Raise a configuration error if it's not a valid
        # config.
        self.new(configuration.ip_address, &block)
      end

      def __getobj__
        @_client
      end
    end
  end
end
