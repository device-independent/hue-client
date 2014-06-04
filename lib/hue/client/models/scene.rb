module Hue
  module Client
    module Models
      class Scene
        include Comparable

        # Create an instance of the Scene object
        #
        # @return [Hue::Client::Models::Scene] Self
        def initialize(attributes={})
          @attributes = attributes
        end

        # Implement spaceship for comparable
        #
        # @return [Hue::Client::Models::Scene]
        def <=>(other)
          self.name <=> other.name
        end

        # Returns the identifier of the Scene
        #
        # @return [String] Identifier
        def id
          @attributes.fetch('id', nil)
        end

        # Returns the name of the Scene
        #
        # @return [String] Name of the scene
        def name
          @attributes.fetch('name', nil)
        end

        # Returns the active status
        #
        # @return [Boolean] Active status
        def active
          @attributes.fetch('active', false)
        end
        alias :active? :active

        # Return a collection of Light IDs
        #
        # @return [Array] Collection of light ids
        def light_ids
          @attributes.fetch('lights', [])
        end
      end
    end
  end
end
