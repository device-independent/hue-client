require File.expand_path('../../../../../../lib/hue/client/models/software_update', __FILE__)

describe Hue::Client::Models::SoftwareUpdate do
  let(:attributes) do
    {
      "updatestate"=>1,
      "url"=> "www.meethue.com/patchnotes/1453",
      "text"=> "This is a software update",
      "notify"=> true
    }
  end

  subject { described_class.new(attributes) }

  context "with values" do
    it "returns the #update_state" do
      expect(subject.update_state).to eq(1)
    end

    it "returns the #url with the update notes" do
      expect(subject.url).to eq('www.meethue.com/patchnotes/1453')
    end

    it "returns the #text description of the update" do
      expect(subject.text).to eq('This is a software update')
    end

    it "returns the #notify status" do
      expect(subject.notify).to be(true)
    end

    it "returns true for #notify?" do
      expect(subject).to be_notify
    end
  end
end
