require File.expand_path('../portal_state', __FILE__)
require File.expand_path('../software_update', __FILE__)
require File.expand_path('../whitelist_users', __FILE__)

module Hue
  module Client
    module Models
      class Configuration
        # Creates an instance of the Configuration object
        #
        # @return [Hue::Client::Models::Configuration] Self
        def initialize(attributes={})
          @attributes = attributes
        end

        # Returns the PortalState object
        #
        # @return [Hue::Client::Models::PortalState]
        def portal_state
          PortalState.new(@attributes.fetch('portalstate', {}))
        end

        # Returns the SoftwareUpdate object
        #
        # @return [Hue::Client::Models::SoftwareUpdate]
        def software_update
          SoftwareUpdate.new(@attributes.fetch('swupdate', {}))
        end

        # Returns the WhitelistUsers collection
        #
        # @return [Hue::Client::Models::WhitelistUsers]
        def whitelist_users
          WhitelistUsers.new(@attributes.fetch('whitelist', {}))
        end
        alias :users :whitelist_users

        # @return [String]
        def portalconnection
          @attributes.fetch('portalconnection', 'disconnected')
        end
        alias :portal_connection :portalconnection

        # @return [Boolean]
        def portalservices
          @attributes.fetch('portalservices', false)
        end
        alias :portal_services :portalservices

        # Returns the proxy port used
        #
        # @return [Integer] Proxy port
        def proxyport
          @attributes.fetch('proxyport', 0)
        end
        alias :proxy_port :proxyport

        # Returns the proxy address used
        #
        # @return [String] None or Proxy address
        def proxyaddress
          @attributes.fetch('proxyaddress', 'none')
        end
        alias :proxy_address :proxyaddress

        # Returns the mac address used
        #
        # @return [String] Mac Address
        def mac
          @attributes.fetch('mac', nil)
        end
        alias :mac_address :mac

        # Returns the netmask
        #
        # @return [String] Netmask
        def netmask
          @attributes.fetch('netmask', nil)
        end

        # Returns the DHCP status
        #
        # @return [Boolean]
        def dhcp
          @attributes.fetch('dhcp', false)
        end
        alias :dhcp? :dhcp

        # Returns the gateway used
        #
        # @return [String] Gateway
        def gateway
          @attributes.fetch('gateway', nil)
        end

        # Returns the IP Address of the bridge
        #
        # @return [String] IP Address
        def ipaddress
          @attributes.fetch('ipaddress', nil)
        end
        alias :ip_address :ipaddress

        # Returns the UTC timestamp
        #
        # @return [String] Timestamp String
        def utc
          @attributes.fetch('UTC', nil)
        end

        # Returns the name of the bridge
        #
        # @return [String] Name of bridge
        def name
          @attributes.fetch('name', nil)
        end

        # Returns the timezone of the bridge
        #
        # @return [String] Timezone
        def timezone
          @attributes.fetch('timezone', nil)
        end

        # Returns the local time of the bridge
        #
        # @return [String] Timestamp String
        def localtime
          @attributes.fetch('localtime', nil)
        end
        alias :local_time :localtime

        # Return the local time as DateTime
        #
        # @return [DateTime] DateTime object
        def current_time
          begin
            Time.parse(self.localtime)
          rescue
            nil
          end
        end

        # Return the version of the software on the bridge
        #
        # @return [String] Software version
        def swversion
          @attributes.fetch('swversion', nil)
        end
        alias :software_version :swversion

        # Return the current API version of the bridge
        #
        # @return [String] API version
        def apiversion
          @attributes.fetch('apiversion', nil)
        end
        alias :api_version :apiversion

        def linkbutton
          @attributes.fetch('linkbutton', false)
        end
        alias :link_button :linkbutton
        alias :link_button? :linkbutton
      end
    end
  end
end
