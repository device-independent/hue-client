require File.expand_path('../../../../../../lib/hue/client/models/light_state', __FILE__)

describe Hue::Client::Models::LightState do
  let(:attributes) do
    {
      "hue"=> 50000,
      "on"=> true,
      "effect"=> "none",
      "alert"=> "none",
      "bri"=> 200,
      "sat"=> 200,
      "ct"=> 500,
      "xy"=> [0.5, 0.5],
      "reachable"=> true,
      "colormode"=> "hs"
    }
  end

  subject { described_class.new(attributes) }

  context "with values" do
    it "returns the #hue" do
      expect(subject.hue).to eq(50000)
    end

    it "returns the #on status" do
      expect(subject.on).to eq(true)
    end

    it "returns true for #on?" do
      expect(subject).to be_on
    end

    it "returns the #brightness" do
      expect(subject.brightness).to eq(200)
    end

    it "returns the #saturation" do
      expect(subject.saturation).to eq(200)
    end

    it "returns the #color_temperature" do
      expect(subject.color_temperature).to eq(500)
    end

    it "returns the #reachable status" do
      expect(subject.reachable).to eq(true)
    end

    it "returns true for #reachable?" do
      expect(subject).to be_reachable
    end

    it "returns the #xy values" do
      expect(subject.xy).to eq([0.5, 0.5])
    end

    it "returns the #color_mode" do
      expect(subject.color_mode).to eq('hs')
    end
  end

  context "without values" do
    let(:attributes) { {} }

    it "returns the #hue" do
      expect(subject.hue).to eq(0)
    end

    it "returns the #on status" do
      expect(subject.on).to eq(false)
    end

    it "returns false for #on?" do
      expect(subject).to_not be_on
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

    it "returns the #reachable status" do
      expect(subject.reachable).to eq(false)
    end

    it "returns false for #reachable?" do
      expect(subject).to_not be_reachable
    end

    it "returns the #xy values" do
      expect(subject.xy).to eq([0.0, 0.0])
    end

    it "returns the #color_mode" do
      expect(subject.color_mode).to eq(nil)
    end
  end
end
