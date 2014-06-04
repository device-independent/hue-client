require File.expand_path('../../../../../../lib/hue/client/models/group_action', __FILE__)

describe Hue::Client::Models::GroupAction do
  let(:attributes) do
    {
      "on"=> true,
      "hue"=> 1234,
      "effect"=> "none",
      "bri"=> 100,
      "sat"=> 100,
      "ct"=> 500,
      "xy"=> [0.5, 0.5]
    }
  end

  subject { described_class.new(attributes) }

  context "with values" do
    it "returns the #on status" do
      expect(subject.on).to be(true)
    end

    it "returns true for #on?" do
      expect(subject).to be_on
    end

    it "returns the #hue" do
      expect(subject.hue).to eq(1234)
    end

    it "returns the #effect" do
      expect(subject.effect).to eq('none')
    end

    it "returns the #brightness" do
      expect(subject.brightness).to eq(100)
    end

    it "returns the #saturation" do
      expect(subject.saturation).to eq(100)
    end

    it "returns the #color_temperature" do
      expect(subject.color_temperature).to eq(500)
    end

    it "returns the #xy values" do
      expect(subject.xy).to eq([0.5, 0.5])
    end
  end

  context "without values" do
    let(:attributes) { {} }

    it "returns the #on status" do
      expect(subject.on).to be(false)
    end

    it "returns false for #on?" do
      expect(subject).to_not be_on
    end

    it "returns the #hue" do
      expect(subject.hue).to eq(0)
    end

    it "returns the #effect" do
      expect(subject.effect).to eq('none')
    end

    it "returns the #brightness" do
      expect(subject.brightness).to eq(0)
    end

    it "returns the #saturation" do
      expect(subject.saturation).to eq(0)
    end

    it "returns the #color_temperature" do
      expect(subject.color_temperature).to eq(0)
    end

    it "returns the #xy values" do
      expect(subject.xy).to eq([0.0, 0.0])
    end
  end
end
