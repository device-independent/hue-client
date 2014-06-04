module Hue
  module Client
    module Models
      class Bridge
        include Comparable

        # Returns an instance of the Bridge object
        #
        # @return [Hue::Client::Models::Bridge] Self
        def initialize(attributes={})
          @attributes = attributes
        end

        # Implement spaceship for comparable
        #
        # @return [Hue::Client::Models::Bridge]
        def <=>(other)
          self.id <=> other.id
        end

        # Returns the identifier of the bridge
        #
        # @return [String] Identifier
        def id
          @attributes.fetch('id', nil)
        end

        # Returns the IP Address of the bridge
        #
        # @return [String] Bridge IP Address
        def internalipaddress
          @attributes.fetch('internalipaddress', nil)
        end
        alias :internal_ip_address :internalipaddress

        # Returns the MAC address of the bridge
        #
        # @return [String] Bridge MAC Address
        def macaddress
          @attributes.fetch('macaddress', nil)
        end
        alias :mac_address :macaddress
      end
    end
  end
end
