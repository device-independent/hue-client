require 'time'
require 'restless_router'

require "hue/client/version"

require "hue/client/core_extension"
require "hue/client/core_extension/time"

require 'hue/client/models/portal_state'
require 'hue/client/models/software_update'

require 'hue/client/models/configuration'

require 'hue/client/configuration'
require 'hue/client/connection'

require 'hue/client/models'

require 'hue/client/models/bridge'
require 'hue/client/models/bridges'

require 'hue/client/models/color_mode'
require 'hue/client/models/light_state'

require 'hue/client/models/light'
require 'hue/client/models/lights'

require 'hue/client/models/group_action'

require 'hue/client/models/group'
require 'hue/client/models/groups'

require 'hue/client/models/schedule'
require 'hue/client/models/schedules'

require 'hue/client/models/whitelist_user'
require 'hue/client/models/whitelist_users'

require 'hue/client/models/scene'
require 'hue/client/models/scenes'

module Hue
  module Client
    def self.routes
      routes = RestlessRouter::Routes.new

      # Portal discovery
      portal_discovery_path = "http://www.meethue.com/api/nupnp"
      routes.add_route(RestlessRouter::Route.new('portal-discovery', portal_discovery_path))

      # Retrieve all Lights
      lights_path = "/api/{username}/lights"
      routes.add_route(RestlessRouter::Route.new('lights', lights_path, templated: true))

      # Retrieve new lights
      new_lights_path = "/api/{username}/lights/new"
      routes.add_route(RestlessRouter::Route.new('new-lights', new_lights_path, templated: true))

      # Retrieve light attributes. Used to `set` and `get` the attributes.
      light_attributes_path = "/api/{username}/lights/{id}"
      routes.add_route(RestlessRouter::Route.new('light-attributes', light_attributes_path, templated: true))

      # Set the light state
      light_state_path = "/api/{username}/lights/{id}/state"
      routes.add_route(RestlessRouter::Route.new('light-state', light_state_path, templated: true))

      # Retrieve all Groups
      groups_path = "/api/{username}/groups"
      routes.add_route(RestlessRouter::Route.new('groups', groups_path, templated: true))

      # Retrieve group attributes. Used to `set` and `get` the attributes.
      group_attributes_path = "/api/{username}/groups/{id}"
      routes.add_route(RestlessRouter::Route.new('group-attributes', group_attributes_path, templated: true))

      # Set the group state
      group_state_path = "/api/{username}/groups/{id}/action"
      routes.add_route(RestlessRouter::Route.new('group-state', group_state_path, templated: true))

      # Retrieve all Schedules. Used to `set` and `get` the schedules.
      schedules_path = "/api/{username}/schedules"
      routes.add_route(RestlessRouter::Route.new('schedules', schedules_path, templated: true))

      # Retrieve schedule attributes. Used to `set`, `get`, and `delete` the attributes.
      schedule_attributes_path = "/api/{username}/schedules/{id}"
      routes.add_route(RestlessRouter::Route.new('schedule-attributes', schedule_attributes_path, templated: true))

      # User Creation
      create_user_path = "/api"
      routes.add_route(RestlessRouter::Route.new('new-user', create_user_path))

      # Retrieve the full datastore
      datastore_path = "/api/{username}"
      routes.add_route(RestlessRouter::Route.new('datastore', datastore_path, templated: true))

      # User Deletion
      delete_user_path = "/api/{username}/config/whitelist/{other_username}"
      routes.add_route(RestlessRouter::Route.new('delete-user', delete_user_path, templated: true))

      # Retrieve configuration. Used to `set` and `get` configuration.
      configuration_path = "/api/{username}/config"
      routes.add_route(RestlessRouter::Route.new('configuration', configuration_path, templated: true))

      routes
    end
  end
end
