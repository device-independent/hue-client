# Philips Hue Client

This gem allows you to utilize the [Philips Hue
API](http://developers.meethue.com) to interact with your Hue Lights.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hue-client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hue-client

## Usage

> NOTE: Currently under development. The notes below describe future capabilities.

This gem will support access to all aspects of your Hue Lighting System:

* **Portal/Bridge** management.
* **User/Whitelist** management.
* **Lights** management.
* **Groups** management.
* **Schedules** management.
* **Scenes** management.

### Configuration
You can specify your configuration if known ahead of time. Things like
your bridge `ip_address` and `username` are needed for all requests.

```ruby
Hue.configure do |c|
  c.ip_address '10.0.1.1' # Default will be the address of the bridge in use
  c.username 'my-username' # Default will be a random hex
  c.logger Logger.new('my-file.log') # Default is $stdout
end
```

### Connection
When connecting, the gem will utilize the _portal discovery_ endpoint to
discover the bridges on your network. This configuration will be cached
locally for later requests.

### Routing
The Hue API does not support
[Hypermedia](http://en.wikipedia.org/wiki/HATEOAS). Instead of littering
the code with URL building, all supported routes will be added to a
`Routing` file and can be used within the _resource_ objects. 

We will also utilize [URI Templates](http://tools.ietf.org/html/rfc6570)
for the instances, where you can interpolate the necessary attributes.

```ruby
routes = bridge.routes
# => [RouteObject, RouteObject]

# Find a route by it's link relationship
route = routes.find('lights')
# => RouteObject (href: 'http://example.com/api/username/lights', rel: lights')

route.url_for
# => http://example.com/api/username/lights

# Find an instance
route = routes.find('light')
# => RouteObject (href: 'http://example.com/api/username/lights/{id}', rel: 'light')

route.url_for(id: '1234')
# => http://example.com/api/username/lights/123

```

### Authentication
The gem will require you to authenticate by pressing the button on your
bridge(s). This will be a one time setup and will be used for subsequent
requests until authorization is revoked.

```ruby
# Authenticate and create a new user.
user = bridge.user.create('my-username')

# You can also create and raise exceptions if errors occur
user = bridge.user.create!('my-username')
# => UserObject

# Then you can find the user
user = bridge.users.find_by_username('my-username')
# => UserObject
```

### Querying
There will be helper methods allowing you to find objects by name or
other attributes.

```ruby
# Find all lights that match a name
lights = bridge.lights.find_all_by_name('Kids Room')
# => [LightObject, LightObject]

# Find a light in the collection by assigned ID
light = bridge.lights.find(1)
# => LightObject
```

### Validations
The client will adhere to the rules specified in the
[Datatypes](http://developers.meethue.com/9_datatypes.html) definitions
in the API. You will be given helper methods that allow you to check the
validity of a request before it is sent to the `bridge`.

```ruby
light = bridge.lights.find(1)

# Change the attributes to something invalid
light.brightness = 500
light.saturation = 500

# Check to see if valid before performing a request
light.valid?
# => false

# Inspect the errors
light.errors
# => [ErrorObject]

# Save the updated attributes
light.save
# => false

# If you choose, you may do this within a single call. Calling #save! Will raise an exception if there are errors.
light.save!
```

### Changes
When you are making modifications to objects, you can always inspect the
changes that are ready to be persisted.`

```ruby
# Find your light
light = bridge.lights.find(1)

light.brightness = 200
# => 200

light.changed?
# => true

light.changes
# => [ChangeObject, ChangeObject]

light.change_to(:brightness)
# => ChangeObject
```

## API Limitations
The Hue API does not currently fully support _scenes_ or _groups_. In
order to make up for this, the gem can be configured to cache the
information locally.

This local cache can later be replaced by the fully supported API
endpoints when Philips makes them available.

We also want to make sure the proper relationships are created.
Currently most libraries assume a single `bridge` and then accessing
from there. This library will allow you to connect and query multiple
`bridges`.

## Contributing

1. Fork it ( http://github.com/<my-github-username>/hue-client/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
