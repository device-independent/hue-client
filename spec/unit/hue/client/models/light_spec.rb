require File.expand_path('../../../../../../lib/hue/client/models/light', __FILE__)

describe Hue::Client::Models::Light do
  let(:attributes) do
    {
      "id" => '1',
      "state"=> {
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
      },
      "type"=> "Living Colors",
      "name"=> "LC 1",
      "modelid"=> "LC0015",
      "swversion"=> "1.0.3",
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
  end

  subject { described_class.new(attributes) }

  context "with values" do
    it "returns the #id" do
      expect(subject.id).to eq('1')
    end

    it "returns the #name" do
      expect(subject.name).to eq('LC 1')
    end

    it "returns the #type" do
      expect(subject.type).to eq('Living Colors')
    end

    it "returns the #model_id" do
      expect(subject.model_id).to eq('LC0015')
    end

    it "returns the #software_version" do
      expect(subject.software_version).to eq('1.0.3')
    end

    context "state delegation" do
      it "delegates the #brightness to the #state" do
        expect(subject.brightness).to eq(200)
      end

      it "delegates the #saturation to the #state" do
        expect(subject.saturation).to eq(200)
      end

      it "delegates the #color_mode to the #state" do
        expect(subject.color_mode).to be_a(Hue::Client::Models::ColorMode)
      end

      it "delegates the #color_temperature to the #state" do
        expect(subject.color_temperature).to eq(500)
      end

      it "delegates the #hue to the #state" do
        expect(subject.hue).to eq(50000)
      end

      it "delegates the #on status to the #state" do
        expect(subject.on).to eq(true)
      end

      it "delegates the #on? status to the #state" do
        expect(subject).to be_on
      end

      it "delegates the #reachable status to the #state" do
        expect(subject.reachable).to eq(true)
      end

      it "delegates the #reachable? status to the #state" do
        expect(subject).to be_reachable
      end
    end
  end
end
