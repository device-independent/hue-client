require File.expand_path('../../../../../../lib/hue/client/models/scenes', __FILE__)

describe Hue::Client::Models::Scenes do
  let(:attributes) do
    {
      "282e003462-on-0"=> {
        "active"=> true,
        "lights"=> [
          "1",
          "2",
          "3"
        ],
        "name"=> "BlueStrip on 0"
      },
      "8f92cd67ce-off-0"=> {
        "active"=> true,
        "lights"=> [
          "1",
          "2",
          "3",
          "4",
          "5",
          "6",
          "7",
          "8",
          "9",
          "10",
          "11",
          "12",
          "13",
          "14"
        ],
        "name"=> "Deep Sea off 0"
      }
    }
  end

  subject { described_class.new(attributes) }

  context "with values" do
    it "returns 2 for the #count" do
      expect(subject.count).to eq(2)
    end

    it "returns true for #any?" do
      expect(subject.any?).to be(true)
    end

    describe "#find_by_id" do
      it "returns the record with specified ID" do
        expect(subject.find_by_id('8f92cd67ce-off-0')).to_not be_nil
      end

      it "returns nil if no record is found" do
        expect(subject.find_by_id('notfound')).to be_nil
      end
    end

    describe "#sort" do
      it "returns the groups sorted by name" do
        expect(subject.sort.map(&:name)).to eq(['BlueStrip on 0', 'Deep Sea off 0'])
      end
    end
  end

  context "without values" do
    let(:attributes) { {} }

    it "returns 0 for the #count" do
      expect(subject.count).to eq(0)
    end

    it "returns false for #any?" do
      expect(subject.any?).to be(false)
    end

    describe "#find_by_id" do
      it "returns nil" do
        expect(subject.find_by_id('notfound')).to be_nil
      end
    end
  end
end
