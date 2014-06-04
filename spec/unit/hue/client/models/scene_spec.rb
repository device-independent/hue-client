require File.expand_path('../../../../../../lib/hue/client/models/scene', __FILE__)

describe Hue::Client::Models::Scene do
  let(:attributes) do
    {
      "id" => "282e003462-on-0",
      "active" => true,
      "lights" => [
        "1",
        "2",
        "3"
      ],
      "name" => "BlueStrip on 0"
    }
  end

  subject { described_class.new(attributes) }

  context "with values" do
    it "returns the #id" do
      expect(subject.id).to eq('282e003462-on-0')
    end

    it "returns the #name" do
      expect(subject.name).to eq('BlueStrip on 0')
    end

    it "returns the #active status" do
      expect(subject.active).to be(true)
    end

    it "returns true for #active?" do
      expect(subject).to be_active
    end

    it "returns a collection of #light_ids" do
      expect(subject.light_ids).to eq(['1', '2', '3'])
    end
  end

  context "without values" do
    let(:attributes) { {} }

    it "returns the #id" do
      expect(subject.id).to be_nil
    end

    it "returns the #name" do
      expect(subject.name).to be_nil
    end

    it "returns the #active status" do
      expect(subject.active).to be(false)
    end

    it "returns false for #active?" do
      expect(subject).to_not be_active
    end

    it "returns a collection of #light_ids" do
      expect(subject.light_ids).to eq([])
    end
  end
end
