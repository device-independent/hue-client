require File.expand_path('../../../../../../lib/hue/client/models/bridge', __FILE__)

describe Hue::Client::Models::Bridge do
  let(:attributes) do
    {
      'id'                => '001788fffe0923cb',
      'internalipaddress' => "192.168.1.37",
      'macaddress'        => "00:17:88:09:23:cb"
    }
  end

  subject { described_class.new(attributes) }

  context "with values" do
    it "returns the #id" do
      expect(subject.id).to eq('001788fffe0923cb')
    end

    it "returns the #internal_ip_address" do
      expect(subject.internal_ip_address).to eq('192.168.1.37')
    end

    it "returns the #mac_address" do
      expect(subject.mac_address).to eq('00:17:88:09:23:cb')
    end
  end

  context "without values" do
    let(:attributes) { {} }

    it "returns nil for the #id" do
      expect(subject.id).to be_nil
    end

    it "returns nil for the #internal_ip_address" do
      expect(subject.internal_ip_address).to be_nil
    end

    it "returns nil for the #mac_address" do
      expect(subject.mac_address).to be_nil
    end
  end
end
