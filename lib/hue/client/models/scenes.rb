require File.expand_path('../scene', __FILE__)

module Hue
  module Client
    module Models
      class Scenes
        include Enumerable

        # Create an instance of the Scenes
        # collection
        #
        # @return [Hue::Client::Models::Scenes] Self
        def initialize(attributes={})
          @attributes = attributes
        end

        # Implement each for Enumerable
        #
        # @return [Iterator]
        def each(&block)
          scenes_collection.each(&block)
        end

        # Find the scene with the specified ID
        #
        # @return [Hue::Client::Models::Scene, nil] Scene or nil
        def find_by_id(id)
          self.select { |record| record.id == id.to_s }.first
        end

        # Find all scenes with the specified Light ID
        #
        # @return [Array] Scenes
        def find_by_light_id(id)
          self.select { |record| record.light_ids.include?(id.to_s) }
        end

        private
        def scenes_collection
          @attributes.map do |k,v|
            scene_attributes = v.merge!('id' => k)
            Scene.new(scene_attributes)
          end
        end
      end
    end
  end
end
