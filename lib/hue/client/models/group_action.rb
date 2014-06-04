module Hue
  module Client
    module Models
      class GroupAction
        def initialize(attributes={})
          @attributes = attributes
        end

        # Returns the on/off state of the group.
        #
        # @return [Boolean] State of the lights
        def on
          @attributes.fetch('on', false)
        end
        alias :on? :on

        # Returns the hue of the group.
        #
        # @return [Integer] Hue of the lights
        def hue
          @attributes.fetch('hue', 0)
        end

        # Returns the effect of the group. One of
        #
        # * none
        # * colorloop
        #
        # @return [String] Effect of the lights
        def effect
          @attributes.fetch('effect', 'none')
        end

        # Returns the brightness of the group.
        #
        # @return [Integer] Brightness of the lights
        def bri
          @attributes.fetch('bri', 0)
        end
        alias :brightness :bri

        # Returns the saturation of the group.
        #
        # @return [Integer] Saturation of the lights
        def sat
          @attributes.fetch('sat', 0)
        end
        alias :saturation :sat

        # Returns the color temperature of the group.
        #
        # @return [Integer] Color Temperature of the lights
        def ct
          @attributes.fetch('ct', 0)
        end
        alias :color_temperature :ct

        def xy
          @attributes.fetch('xy', [0.0, 0.0])
        end
      end
    end
  end
end
