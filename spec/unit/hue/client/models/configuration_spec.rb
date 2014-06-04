require File.expand_path('../../../../../../lib/hue/client/models/configuration', __FILE__)

describe Hue::Client::Models::Configuration do
  let(:attributes) do
    {
      "portalstate" => {
        "communication" => "disconnected",
        "outgoing" => true,
        "incoming" => true,
        "signedon" => true
      },
      "portalconnection" => "connected",
      "portalservices" => true,
      "proxyport"=> 10,
      "UTC"=> "2012-10-29T12:00:00",
      "name"=> "Smartbridge 1",
      "localtime" => "2014-06-04T14:05:24",
      "timezone" => "America/New_York",
      "swupdate"=> {
        "updatestate"=>1,
        "url"=> "www.meethue.com/patchnotes/1453",
        "text"=> "This is a software update",
        "notify"=> false
      },
      "whitelist"=> {
        "1234567890"=> {
          "last use date"=> "2010-10-17T01:23:20",
          "create date"=> "2010-10-17T01:23:20",
          "name"=> "iPhone Web 1"
        }
      },
      "swversion"=> "01003542",
      "apiversion"=> "1.2.1",
      "proxyaddress"=> "none",
      "mac"=> "00:17:88:00:00:00",
      "linkbutton"=> false,
      "ipaddress"=> "192.168.1.100",
      "netmask"=> "255.255.0.0",
      "gateway"=> "192.168.0.1",
      "dhcp"=> true
    }
  end

  subject { described_class.new(attributes) }

  context "with values" do
    it "returns an instance of PortalState for #portal_state" do
      expect(subject.portal_state).to be_a(Hue::Client::Models::PortalState)
    end

    it "returns an instance of SoftwareUpdate for #software_update" do
      expect(subject.software_update).to be_a(Hue::Client::Models::SoftwareUpdate)
    end

    it "returns an instance of WhitelistUsers for #whitelist_users" do
      expect(subject.whitelist_users).to be_a(Hue::Client::Models::WhitelistUsers)
    end

    it "returns the #portal_connection" do
      expect(subject.portal_connection).to eq('connected')
    end

    it "returns the #portal_services" do
      expect(subject.portal_services).to be(true)
    end

    it "returns the #proxy_port" do
      expect(subject.proxy_port).to eq(10)
    end

    it "returns the #proxy_address" do
      expect(subject.proxy_address).to eq('none')
    end

    it "returns the time in UTC" do
      expect(subject.utc).to eq('2012-10-29T12:00:00')
    end

    it "returns the #name" do
      expect(subject.name).to eq('Smartbridge 1')
    end

    it "returns the #timezone" do
      expect(subject.timezone).to eq('America/New_York')
    end

    it "returns the #local_time" do
      expect(subject.local_time).to eq('2014-06-04T14:05:24')
    end

    it "returns the #software_version" do
      expect(subject.software_version).to eq('01003542')
    end

    it "returns the #api_version" do
      expect(subject.api_version).to eq('1.2.1')
    end

    it "returns the #mac_address" do
      expect(subject.mac_address).to eq('00:17:88:00:00:00')
    end

    it "returns the #ip_address" do
      expect(subject.ip_address).to eq('192.168.1.100')
    end

    it "returns the #netmask" do
      expect(subject.netmask).to eq('255.255.0.0')
    end

    it "returns the #gateway" do
      expect(subject.gateway).to eq('192.168.0.1')
    end

    it "returns the #dhcp status" do
      expect(subject.dhcp).to be(true)
    end

    it "returns true for the #dhcp status" do
      expect(subject).to be_dhcp
    end
  end
end
