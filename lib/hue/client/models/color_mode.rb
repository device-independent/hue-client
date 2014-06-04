module Hue
  module Client
    module Models
      class ColorMode
        attr_reader :name

        # Returns an instance of the ColorMode
        # object
        #
        # @return [Hue::Client::Models::ColorMode] Self
        def initialize(name)
          @name = name
        end

        # Returns the human name description from the `mapping`
        #
        # @return [String] Description of the name
        def description
          if mapping.has_key?(self.name)
            mapping[self.name]
          else
            self.name
          end
        end

        private
        def mapping
          {
            'ct' => 'Color Temperature',
            'hs' => 'Hue and Saturation',
            'xy' => 'XY'
          }
        end
      end
    end
  end
end
