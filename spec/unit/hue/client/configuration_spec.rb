require File.expand_path('../../../../../lib/hue/client/configuration', __FILE__)

describe Hue::Client::Configuration do
  let(:ip_address) { '12.1.1.2' }
  let(:username) { 'lestertester' }

  subject { described_class.new(ip_address: ip_address, username: username) }

  context "retrieving configuration values" do
    it "returns the #ip_address" do
      expect(subject.ip_address).to eq('12.1.1.2')
    end

    it "returns the #username" do
      expect(subject.username).to eq('lestertester')
    end
  end

  context "setting values with a block" do
    subject do
      described_class.new do |c|
        c.ip_address = '1.1.1.1'
        c.username   = 'anothername'
      end
    end

    it "returns the #ip_address" do
      expect(subject.ip_address).to eq('1.1.1.1')
    end

    it "returns the #username" do
      expect(subject.username).to eq('anothername')
    end
  end

  context "without values provided" do
    subject { described_class.new }

    it "returns nil for #ip_address" do
      expect(subject.ip_address).to be_nil
    end

    it "returns nil for #username" do
      expect(subject.username).to be_nil
    end
  end
end
