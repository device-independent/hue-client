require File.expand_path('../../../../../../lib/hue/client/models/data_store', __FILE__)

describe Hue::Client::Models::DataStore do
  let(:attributes) do
    {
      "lights"=> {
        "1"=> {
          "state"=> {
            "on"=> false,
            "bri"=> 0,
            "hue"=> 0,
            "sat"=> 0,
            "xy"=> [0.0000, 0.0000],
            "ct"=> 0,
            "alert"=> "none",
            "effect"=> "none",
            "colormode"=> "hs",
            "reachable"=> true
          },
          "type"=> "Extended color light",
          "name"=> "Hue Lamp 1",
          "modelid"=> "LCT001",
          "swversion"=> "65003148",
          "pointsymbol"=> {
            "1"=> "none",
            "2"=> "none",
            "3"=> "none",
            "4"=> "none",
            "5"=> "none",
            "6"=> "none",
            "7"=> "none",
            "8"=> "none"
          }
        },
        "2"=> {
          "state"=> {
            "on"=> true,
            "bri"=> 254,
            "hue"=> 33536,
            "sat"=> 144,
            "xy"=> [0.3460, 0.3568],
            "ct"=> 201,
            "alert"=> "none",
            "effect"=> "none",
            "colormode"=> "hs",
            "reachable"=> true
          },
          "type"=> "Extended color light",
          "name"=> "Hue Lamp 2",
          "modelid"=> "LCT001",
          "swversion"=> "65003148",
          "pointsymbol"=> {
            "1"=> "none",
            "2"=> "none",
            "3"=> "none",
            "4"=> "none",
            "5"=> "none",
            "6"=> "none",
            "7"=> "none",
            "8"=> "none"
          }
        }
      },
      "scenes" => {
        "282e003462-on-0" =>  {
          "active" => true,
          "lights" => [
            "1",
            "2",
            "3"
          ],
          "name" => "BlueStrip on 0"
        }
      },
      "groups"=> {
        "1"=> {
          "action"=> {
            "on"=> true,
            "bri"=> 254,
            "hue"=> 33536,
            "sat"=> 144,
            "xy"=> [0.3460, 0.3568],
            "ct"=> 201,
            "effect"=> "none",
            "colormode"=> "xy"
          },
          "lights"=> ["1", "2"],
          "name"=> "Group 1"
        }
      },
      "config"=> {
        "name"=> "Philips hue",
        "mac"=> "00:00:88:00:bb:ee",
        "dhcp"=> true,
        "ipaddress"=> "192.168.1.74",
        "netmask"=> "255.255.255.0",
        "gateway"=> "192.168.1.254",
        "proxyaddress"=> "",
        "proxyport"=> 0,
        "UTC"=> "2012-10-29T12:00:00",
        "whitelist"=> {
          "newdeveloper"=> {
            "last use date"=> "2012-10-29T12:00:00",
            "create date"=> "2012-10-29T12:00:00",
            "name"=> "test user"
          }
        },
        "swversion"=> "01003372",
        "swupdate"=> {
          "updatestate"=> 0,
          "url"=> "",
          "text"=> "",
          "notify"=> false
        },
        "linkbutton"=> false,
        "portalservices"=> false
      },
      "schedules"=> {
        "1"=> {
          "name"=> "schedule",
          "description"=> "",
          "command"=> {
            "address"=> "/api/<username>/groups/0/action",
            "body"=> {
              "on"=> true
            },
            "method"=> "PUT"
          },
          "time"=> "2012-10-29T12:00:00"
        }
      }
    }
  end

  subject { described_class.new(attributes) }

  context "with values" do
    it "returns a Scenes object for #scenes" do
      expect(subject.scenes).to be_a(Hue::Client::Models::Scenes)
    end

    it "returns true for #scenes?" do
      expect(subject.scenes?).to be(true)
    end

    it "returns a Schedules object for #scehdules" do
      expect(subject.schedules).to be_a(Hue::Client::Models::Schedules)
    end

    it "returns true for #schedules?" do
      expect(subject.schedules?).to be(true)
    end

    it "returns a Configuration object for #configuration" do
      expect(subject.configuration).to be_a(Hue::Client::Models::Configuration)
    end

    it "returns a Groups object for #groups" do
      expect(subject.groups).to be_a(Hue::Client::Models::Groups)
    end

    it "returns true for #groups?" do
      expect(subject.groups?).to be(true)
    end

    it "returns a Lights object for #lights?" do
      expect(subject.lights).to be_a(Hue::Client::Models::Lights)
    end

    it "returns true for #lights?" do
      expect(subject.lights?).to be(true)
    end
  end

  context "without values" do
    let(:attributes) { {} }

    it "returns a Scenes object for #scenes" do
      expect(subject.scenes).to be_a(Hue::Client::Models::Scenes)
    end

    it "returns false for #scenes?" do
      expect(subject.scenes?).to be(false)
    end

    it "returns a Schedules object for #scehdules" do
      expect(subject.schedules).to be_a(Hue::Client::Models::Schedules)
    end

    it "returns false for #schedules?" do
      expect(subject.schedules?).to be(false)
    end

    it "returns a Configuration object for #configuration" do
      expect(subject.configuration).to be_a(Hue::Client::Models::Configuration)
    end

    it "returns a Groups object for #groups" do
      expect(subject.groups).to be_a(Hue::Client::Models::Groups)
    end

    it "returns false for #groups?" do
      expect(subject.groups?).to be(false)
    end

    it "returns a Lights object for #lights?" do
      expect(subject.lights).to be_a(Hue::Client::Models::Lights)
    end

    it "returns false for #lights?" do
      expect(subject.lights?).to be(false)
    end
  end
end
