require File.expand_path('../whitelist_user', __FILE__)

module Hue
  module Client
    module Models
      class WhitelistUsers
        include Enumerable

        # Creates an instance of the WhitelistUsers
        # collection
        #
        # @return [Hue::Client::Models::WhitelistUsers] Self
        def initialize(attributes={})
          @attributes = attributes
        end

        # Implement each to support Enumerable
        #
        # @return [Iterator]
        def each(&block)
          whitelist_users_collection.each(&block)
        end

        # Returns the record by specified ID
        #
        # @return [Hue::Client::Models::WhitelistUser, nil] User or nil
        def find_by_id(id)
          self.select { |record| record.id == id.to_s }.first
        end

        private
        def whitelist_users_collection
          @attributes.map do |k,v|
            user_attributes = v.merge!("id" => k)
            WhitelistUser.new(user_attributes)
          end
        end
      end
    end
  end
end
