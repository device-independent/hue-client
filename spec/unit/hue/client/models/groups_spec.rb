require File.expand_path('../../../../../../lib/hue/client/models/groups', __FILE__)

describe Hue::Client::Models::Groups do
  let(:attributes) do
    {
      "1" => {
        "name" => "Group 1"
      },
      "2" => {
        "name" => "Group 2"
      },
      "3" => {
        "name" => "Group 3"
      },
      "4" => {
        "name" => "Group 4"
      }
    }
  end

  subject { described_class.new(attributes) }

  context "with values" do
    it "returns 4 for the #count" do
      expect(subject.count).to eq(4)
    end

    it "returns true for #any?" do
      expect(subject.any?).to be(true)
    end

    describe "#find_by_id" do
      it "returns the record with specified ID" do
        expect(subject.find_by_id('1')).to_not be_nil
      end

      it "returns nil if no record is found" do
        expect(subject.find_by_id('notfound')).to be_nil
      end
    end

    describe "#sort" do
      it "returns the groups sorted by name" do
        expect(subject.sort.map(&:name)).to eq(['Group 1', 'Group 2', 'Group 3', 'Group 4'])
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
