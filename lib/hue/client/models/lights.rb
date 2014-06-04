require File.expand_path('../light', __FILE__)

module Hue
  module Client
    module Models
      class Lights
        include Enumerable

        # Create a new instance of the Lights
        # collection.
        #
        # @return [Hue::Client::Models::Lights] Self
        def initialize(attributes={})
          @attributes = attributes
        end

        def each(&block)
          lights_collection.each(&block)
        end

        # Find the light by the identifier
        #
        # @return [Hue::Client::Models::Light, nil] Light or nil
        def find_by_id(id)
          self.select { |record| record.id == id.to_s }.first
        end

        private
        def lights_collection
          @attributes.map do |k,v|
            light_attributes = v.merge!("id" => k)
            Light.new(light_attributes)
          end
        end
      end
    end
  end
end
