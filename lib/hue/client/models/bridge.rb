module Hue
  module Client
    module Models
      class Bridge
        include Comparable

        def initialize(attributes={})
          @attributes = attributes
        end

        def id
          @attributes.fetch('id', nil)
        end

        def internalipaddress
          @attributes.fetch('internalipaddress', nil)
        end
        alias :internal_ip_address :internalipaddress

        def macaddress
          @attributes.fetch('macaddress', nil)
        end
        alias :mac_address :macaddress
      end
    end
  end
end
