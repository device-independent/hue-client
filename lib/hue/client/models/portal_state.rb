module Hue
  module Client
    module Models
      class PortalState
        # Creates an instance of the PortalStaste object
        #
        # @return [Hue::Client::Models::PortalState] Self
        def initialize(attributes={})
          @attributes = attributes
        end

        # @return [String] Connected status
        def communication
          @attributes.fetch('communication', 'disconnected')
        end

        # @return [Boolean] If it's connected
        def connected?
          'connected' == self.communication
        end

        # @return [Boolean] Outgoing status
        def outgoing
          @attributes.fetch('outgoing', false)
        end
        alias :outgoing? :outgoing

        # @return [Boolean] Incoming status
        def incoming
          @attributes.fetch('incoming', false)
        end
        alias :incoming? :incoming

        # @return [Boolean] Signed on status
        def signedon
          @attributes.fetch('signedon', false)
        end
        alias :signed_on :signedon
        alias :signed_on? :signedon
      end
    end
  end
end
