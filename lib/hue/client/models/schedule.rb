require 'time'
require File.expand_path('../../../core_extension/time', __FILE__)

module Hue
  module Client
    module Models
      class Schedule
        include Comparable

        def initialize(attributes={}, options={})
          @attributes = attributes
          @options    = options
        end

        # Define the comparison method
        #
        # @return [Hue::Client::Models::Schedule] Sorted instance
        def <=>(other)
          self.trigger_at <=> other.trigger_at
        end

        # The identifier of the schedule
        #
        # @return [String] Schedule identifier
        def id
          @attributes.fetch('id', nil)
        end

        # The provided name of the schedule
        #
        # @return [String] Schedule name
        def name
          @attributes.fetch('name', nil)
        end

        # The provided description of the schedule
        #
        # @return [String] Schedule description
        def description
          @attributes.fetch('description', nil)
        end

        # The status of the schedule
        #
        # @return [String] Status of the schedule
        def status
          @attributes.fetch('status', 'disabled')
        end

        # Returns true if the schedule is enabled
        #
        # @return [Boolean] Enabled status
        def enabled?
          'enabled' == self.status
        end

        # The provided time of the schedule
        #
        # @return [String] ISO 8601:2004 Time
        def time
          @attributes.fetch('time', nil)
        end

        # The local time of the schedule
        #
        # @return [String] ISO 8601:2004 Time
        def localtime
          @attributes.fetch('localtime', nil)
        end
        alias :local_time :localtime

        # The date the schedule was created
        #
        # @return [String] Timestamp
        def created
          @attributes.fetch('created', nil)
        end

        # The coerced creation date
        #
        # @return [DateTime]
        def created_at
          begin
            Time.parse(self.created)
          rescue
            nil
          end
        end

        # The time the event will be triggered, based on the timezone provided
        #
        # @return [DateTime] Time the event will trigger
        def trigger_at
          begin
            Time.parse(self.time).extend(CoreExtension::Time).to_zone(timezone)
          rescue
            nil
          end
        end

        # The localt time the event will be triggered
        #
        # @return [DateTime] Time the event will trigger
        def local_trigger_at
          begin
            Time.parse(self.localtime)
          rescue
            nil
          end
        end

        private
        def timezone
          @options.fetch(:timezone, nil)
        end
      end
    end
  end
end
