require 'time'

module Hue
  module Client
    module Models
      class WhitelistUser
        include Comparable

        # Creates an instance of WhitelistUser
        #
        # @return [Hue::Client::Models::WhitelistUser] Self
        def initialize(attributes={})
          @attributes = attributes
        end

        # Support the comparable for sort
        #
        # @return [Hue::Client::Models::WhitelistUser] Compared user
        def <=>(other)
          self.updated_at <=> other.updated_at
        end

        # Returns the identifier of the user
        #
        # @return [String] User identifier
        def id
          @attributes.fetch('id', nil)
        end

        # Returns the name of the user
        #
        # @return [String] Name of the user
        def name
          @attributes.fetch('name', nil)
        end

        # Returns the created date as a string
        #
        # @return [String] Timestamp String
        def create_date
          @attributes.fetch('create date', nil)
        end

        # Returns the DateTime of the creation date
        #
        # @return [DateTime] Creation DateTime
        def created_at
          begin
            Time.parse(self.create_date)
          rescue
            nil
          end
        end

        # Returns the last use date as a string
        #
        # @return [String] Timestamp String
        def last_use_date
          @attributes.fetch('last use date', nil)
        end

        # Returns the DateTime of the last use
        #
        # @return [DateTime] Last Use DateTime
        def last_used_at
          begin
            Time.parse(self.last_use_date)
          rescue
            nil
          end
        end
        alias :updated_at :last_used_at
      end
    end
  end
end
