module Hue
  module Client
    class Configuration
      attr_accessor :ip_address, :username

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
