require File.expand_path('../bridge', __FILE__)

module Hue
  module Client
    module Models
      class Bridges
        include Enumerable

        # Creates an instance of the Bridges
        # collection
        #
        # @return [Hue::Client::Models::Bridges] Self
        def initialize(collection)
          @collection = Array(collection)
        end

        # Implement each for Enumerable
        #
        # @return [Iterator]
        def each(&block)
          bridge_collection.each(&block)
        end

        # Retrieve a Bridge by its ID
        #
        # @return [Hue::Client::Models::Bridge, nil] Bridge or nil
        def find_by_id(id)
          self.select { |record| record.id == id.to_s }.first
        end

        private
        def bridge_collection
          @bridge_collection ||= @collection.map { |record| Bridge.new(record) }
        end
      end
    end
  end
end
