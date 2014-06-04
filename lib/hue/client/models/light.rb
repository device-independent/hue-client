require File.expand_path('../light_state', __FILE__)
require 'forwardable'

module Hue
  module Client
    module Models
      class Light
        include Comparable

        extend Forwardable

        # Delegate the state methods to the LightState object
        def_delegator :state, :brightness
        def_delegator :state, :saturation
        def_delegator :state, :color_mode
        def_delegator :state, :color_temperature
        def_delegator :state, :hue
        def_delegator :state, :on
        def_delegator :state, :on?
        def_delegator :state, :reachable
        def_delegator :state, :reachable?

        # Creates an instance of the Light object
        # given the JSON results from the API.
        #
        # @return [Hue::Client::Models::Light] Self
        def initialize(attributes={})
          @attributes = attributes
        end

        # Allows sorting by name
        #
        # @return [Array] Sorted collection
        def <=>(other)
          self.name <=> other.name
        end

        # Returns the ID of the light itself
        #
        # @return [String] Identifier of the light
        def id
          @attributes.fetch('id', nil)
        end

        # Returns the name of the light
        #
        # @return [String] Name of the light
        def name
          @attributes.fetch('name', nil)
        end

        # Returns the type of the light
        #
        # NOTE: This may be moved into it's own object
        #
        # @return [String] Type of the light
        def type
          @attributes.fetch('type', nil)
        end

        # The string name of the model identifier
        #
        # @return [String] Model Identifier
        def modelid
          @attributes.fetch('modelid', nil)
        end
        alias :model_id :modelid

        def swversion
          @attributes.fetch('swversion', nil)
        end
        alias :software_version :swversion

        def state
          @state ||= LightState.new(@attributes.fetch('state', {}))
        end

        def point_symbol
          # TODO: Return a PointSymbol instance
        end
      end
    end
  end
end
