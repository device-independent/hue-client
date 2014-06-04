module Hue
  module Client
    module Models
      class SoftwareUpdate
        # Creates an instance of the SoftwareUpdate object
        #
        # @return [Hue::Client::Models::SoftwareUpdate] Self
        def initialize(attributes={})
          @attributes = attributes
        end

        # Returns the update state. 1 if it needs an update,
        # 0 if it doesn't
        #
        # @return [Integer] Update status
        def updatestate
          @attributes.fetch('updatestate', 0)
        end
        alias :update_state :updatestate

        # URL of the update notes
        #
        # NOTE: Would be nice if they returned a fully qualified URL
        #
        # @return [String] URL with the patch notes
        def url
          @attributes.fetch('url', nil)
        end

        # The description of the software update
        #
        # @return [String] Update description
        def text
          @attributes.fetch('text', nil)
        end

        # Flag to determine if the client should be notified
        #
        # @return [Boolean] Notification status
        def notify
          @attributes.fetch('notify', false)
        end
        alias :notify? :notify
      end
    end
  end
end
