module Hue
  module Client
    class Configuration
      attr_accessor :ip_address, :username

      # Allows you to create a Configuration object to
      # hold the necessary keys and values.
      #
      # @return [Hue::Client::Configuration] Self
      def initialize(options={})
        if block_given?
          yield(self)
        else
          @ip_address = options.fetch(:ip_address, nil)
          @username   = options.fetch(:username, nil)
        end
      end
    end
  end
end
