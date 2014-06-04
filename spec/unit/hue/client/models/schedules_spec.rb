require File.expand_path('../../../../../../lib/hue/client/models/schedules', __FILE__)

describe Hue::Client::Models::Schedules do
  let(:attributes) do
    {
      "5002137383593297"=> {
        "name"=> "Morning on 559420"
      },
      "3922128030215828"=> {
        "name"=> "Bedroom blue off 988530"
      },
      "1207463055331812"=> {
        "name"=> "Bedroom blue on 806600"
      }
    }
  end

  subject { described_class.new(attributes) }

  context "with values" do
    it "returns 3 for the #count" do
      expect(subject.count).to eq(3)
    end

    it "returns true for #any?" do
      expect(subject.any?).to be(true)
    end

    describe "#find_by_id" do
      it "returns the record with specified ID" do
        expect(subject.find_by_id('5002137383593297')).to_not be_nil
      end

      it "returns nil if no record is found" do
        expect(subject.find_by_id('notfound')).to be_nil
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
  end
end
