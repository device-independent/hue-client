require File.expand_path('../schedule', __FILE__)

module Hue
  module Client
    module Models
      class Schedules
        include Enumerable

        # Create an instance of the Schedules
        # collection
        #
        # @return [Hue::Client::Models::Schedules] Self
        def initialize(attributes={})
          @attributes = attributes
        end

        # Implement each for Enumerable
        #
        # @return [Iterator]
        def each(&block)
          schedules_collection.each(&block)
        end

        # Return the Schedule by the specified ID
        #
        # @return [Hue::Client::Models::Schedule, nil] Schedule or nil
        def find_by_id(id)
          self.select { |record| record.id == id.to_s }.first
        end

        private
        def schedules_collection
          @attributes.map do |k,v|
            schedule_attributes = v.merge!('id' => k)
            Schedule.new(schedule_attributes)
          end
        end
      end
    end
  end
end
