require File.expand_path('../bridge', __FILE__)

module Hue
  module Client
    module Models
      class Bridges
        include Enumerable

        def initialize(collection)
          @collection = Array(collection)
        end

        def each(&block)
          bridge_collection.each(&block)
        end

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
