require File.expand_path('../scenes', __FILE__)
require File.expand_path('../schedules', __FILE__)
require File.expand_path('../configuration', __FILE__)
require File.expand_path('../groups', __FILE__)
require File.expand_path('../lights', __FILE__)

module Hue
  module Client
    module Models
      class DataStore

        # Create an instance of the root DataStore
        # object
        #
        # @return [Hue::Client::Models::DataStore] Self
        def initialize(attributes={})
          @attributes = attributes
        end

        # Returns a Scenes object
        #
        # @return [Hue::Client::Models::Scenes] Scenes Model
        def scenes
          Scenes.new(@attributes.fetch('scenes', {}))
        end

        # Returns true if there are scenes
        #
        # @return [Boolean] Scenes query method
        def scenes?
          self.scenes.any?
        end

        # Returns a Schedules object
        #
        # @return [Hue::Client::Models::Schedules] Schedules model
        def schedules
          Schedules.new(@attributes.fetch('schedules', {}))
        end

        # Returns true if there are schedules
        #
        # @return [Boolean] Schedules query method
        def schedules?
          self.schedules.any?
        end

        # Returns a Configuration object
        #
        # @return [Hue::Client::Models::Configuration] Configuration object
        def configuration
          Configuration.new(@attributes.fetch('config', {}))
        end

        # Returns a Groups object
        #
        # @return [Hue::Client::Models::Groups] Groups object
        def groups
          Groups.new(@attributes.fetch('groups', {}))
        end

        # Returns true if there are groups
        #
        # @return [Boolean] Groups query method
        def groups?
          self.groups.any?
        end

        # Returns a Lights object
        #
        # @return [Hue::Client::Models::Lights] Lights object
        def lights
          Lights.new(@attributes.fetch('lights', {}))
        end

        # Returns true if there are lights
        #
        # @return [Boolean] Lights query method
        def lights?
          self.lights.any?
        end
      end
    end
  end
end
