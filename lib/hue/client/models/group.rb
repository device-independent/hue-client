require File.expand_path('../group_action', __FILE__)
require 'forwardable'

module Hue
  module Client
    module Models
      class Group
        include Comparable
        extend Forwardable

        #Delegate the action methods to the GroupAction object
        def_delegator :action, :on
        def_delegator :action, :on?
        def_delegator :action, :hue
        def_delegator :action, :effect
        def_delegator :action, :brightness
        def_delegator :action, :saturation
        def_delegator :action, :color_temperature
        def_delegator :action, :xy

        # Creates an instance of the Group object
        # given the JSON results from the API.
        #
        # @return [Hue::Client::Models::Group] Self
        def initialize(attributes={})
          @attributes = attributes
        end

        # Enable sorting and comparison
        #
        # @return [Hue::Client::Models::Group] Sorted instance
        def <=>(other)
          self.name <=> other.name
        end

        # Returns the ID of the group
        #
        # @return [String] Identifier of the group
        def id
          @attributes.fetch('id', nil)
        end

        # The name of the group
        #
        # @return [String] Name of the group
        def name
          @attributes.fetch('name', nil)
        end

        # Returns a collection of Light IDS
        #
        # @return [Array] Light IDs
        def light_ids
          @attributes.fetch('lights', [])
        end

        def action
          @action ||= GroupAction.new(@attributes.fetch('action', {}))
        end
      end
    end
  end
end
