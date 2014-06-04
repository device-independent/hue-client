require 'tzinfo'

module Hue
  module CoreExtension
    module Time
      def to_zone(timezone)
        begin
          zone_object = TZInfo::Timezone.get(timezone)
          time_period = zone_object.period_for_utc(self)
          (self + time_period.utc_offset)
        rescue TZInfo::InvalidTimezoneIdentifier
          self
        end
      end
    end
  end
end
