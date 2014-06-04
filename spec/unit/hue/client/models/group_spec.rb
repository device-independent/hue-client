require File.expand_path('../../../../../../lib/hue/client/models/group', __FILE__)

describe Hue::Client::Models::Group do
  let(:attributes) do
    {
      "id" => "1",
      "action"=> {
        "on"=> true,
        "hue"=> 1234,
        "effect"=> "none",
        "bri"=> 100,
        "sat"=> 100,
        "ct"=> 500,
        "xy"=> [0.5, 0.5]
      },
      "lights" => [
        "1",
        "2"
      ],
      "name"=> "bedroom",
      "scenes"=> {
      }
    }
  end

  subject { described_class.new(attributes) }

  context "with values" do
    it "returns the #id" do
      expect(subject.id).to eq('1')
    end

    it "returns the #name" do
      expect(subject.name).to eq('bedroom')
    end

    it "returns a collection of #light_ids" do
      expect(subject.light_ids).to eq(['1', '2'])
    end

    it "returns a GroupAction instance for #action" do
      expect(subject.action).to be_a(Hue::Client::Models::GroupAction)
    end

    context "action delegation" do
      it "delegates the #on status to the #action" do
        expect(subject.on).to be(true)
      end

      it "delegates the #on? status to the #action" do
        expect(subject).to be_on
      end

      it "delegates the #hue to the #action" do
        expect(subject.hue).to eq(1234)
      end

      it "delegates the #effect to the #action" do
        expect(subject.effect).to eq('none')
      end

      it "delegates the #brightness to the #action" do
        expect(subject.brightness).to eq(100)
      end

      it "delegates the #saturation to the #action" do
        expect(subject.saturation).to eq(100)
      end

      it "delegates the #color_temperature to the #action" do
        expect(subject.color_temperature).to eq(500)
      end

      it "delegates the #xy to the #action" do
        expect(subject.xy).to eq([0.5, 0.5])
      end
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

    it "returns a collection of #light_ids" do
      expect(subject.light_ids).to eq([])
    end

    it "returns a GroupAction instance for #action" do
      expect(subject.action).to be_a(Hue::Client::Models::GroupAction)
    end

    context "action delegation" do
      it "delegates the #on status to the #action" do
        expect(subject.on).to be(false)
      end

      it "delegates the #on? status to the #action" do
        expect(subject).to_not be_on
      end

      it "delegates the #hue to the #action" do
        expect(subject.hue).to eq(0)
      end

      it "delegates the #effect to the #action" do
        expect(subject.effect).to eq('none')
      end

      it "delegates the #brightness to the #action" do
        expect(subject.brightness).to eq(0)
      end

      it "delegates the #saturation to the #action" do
        expect(subject.saturation).to eq(0)
      end

      it "delegates the #color_temperature to the #action" do
        expect(subject.color_temperature).to eq(0)
      end

      it "delegates the #xy to the #action" do
        expect(subject.xy).to eq([0.0, 0.0])
      end
    end
  end
end
