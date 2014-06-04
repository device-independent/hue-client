require File.expand_path('../color_mode', __FILE__)

module Hue
  module Client
    module Models
      class LightState
        # Creates an instance of the LightState
        # object for the specified Light.
        #
        # @return [Hue::Client::Models::LightState] Self
        def initialize(attributes={})
          @attributes = attributes
        end

        # Hue of the light. Wrapping value
        # between 0 and 65535.
        #
        # @return [Integer] Hue value
        def hue
          @attributes.fetch('hue', 0)
        end

        # On/Off state of the light
        #
        # @return [Boolean] State of the light
        def on
          @attributes.fetch('on', false)
        end
        alias :on? :on

        # Brightness of the light. This is a scale
        # from the minimum brightness the light is
        # capable of, 0, to the maximum capable
        # brightness, 255.
        #
        # @return [Integer] Brightness of the light
        def bri
          @attributes.fetch('bri', 0)
        end
        alias :brightness :bri

        # Saturation of the light. 255 is the most
        # saturated (colored) and 0 is the least
        # saturated (white)
        #
        # @return [Integer] Saturation of the light
        def sat
          @attributes.fetch('sat', 0)
        end
        alias :saturation :sat

        # The Mired Color Temperature of the light.
        #
        # @return [Integer] Color Temperature of the light
        def ct
          @attributes.fetch('ct', 0)
        end
        alias :color_temperature :ct

        # Indicates if a light can be reached by the bridge.
        #
        # @return [Boolean] Reachable status
        def reachable
          @attributes.fetch('reachable', false)
        end
        alias :reachable? :reachable

        # The x and y coordinates of a color in 
        # CIE color space
        #
        # @return [Array] Float values of the X/Y coordinates
        def xy
          @attributes.fetch('xy', [0, 0])
        end

        # Indicates the color mode in which the light
        # is working.
        #
        # @return [String] String representation of the color mode
        def colormode
          # TODO: Return a ColorMode object
          mode_value = @attributes.fetch('colormode', nil)
          ColorMode.new(mode_value)
        end
        alias :color_mode :colormode
      end
    end
  end
end
