require File.expand_path('../group', __FILE__)

module Hue
  module Client
    module Models
      class Groups
        include Enumerable

        # Create a new instance of the Groups
        # collection.
        #
        # @return [Hue::Client::Models::Groups] Self
        def initialize(attributes={})
          @attributes = attributes
        end

        def each(&block)
          groups_collection.each(&block)
        end

        # Find the group by the identifier
        #
        # @return [Hue::Client::Models::Group, nil] Group or nil
        def find_by_id(id)
          self.select { |record| record.id == id.to_s }.first
        end

        private
        def groups_collection
          @attributes.map do |k,v|
            group_attributes = v.merge!("id" => k)
            Group.new(group_attributes)
          end
        end
      end
    end
  end
end
