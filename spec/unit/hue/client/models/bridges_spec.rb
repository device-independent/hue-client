require File.expand_path('../../../../../../lib/hue/client/models/bridges', __FILE__)

describe Hue::Client::Models::Bridges do
  let(:collection) do
    [
      {
        "id"                => "001788fffe0923cb",
        "internalipaddress" => "192.168.1.37",
        "macaddress"        => "00:17:88:09:23:cb"
      },
      {
        "id"                => "001788fffe0923cbcvb",
        "internalipaddress" => "192.164.1.37",
        "macaddress"        => "00:18:87:08:22:cb"
      }
    ]
  end

  subject { described_class.new(collection) }

  context "with values" do
    it "returns 2 for the #count" do
      expect(subject.count).to eq(2)
    end

    it "returns true for #any?" do
      expect(subject.any?).to eq(true)
    end

    describe "#find_by_id" do
      it "returns the record with specified ID" do
        expect(subject.find_by_id('001788fffe0923cb')).to_not be_nil
      end

      it "returns nil if no record is found" do
        expect(subject.find_by_id('notfound')).to be_nil
      end
    end
  end

  context "without values" do
    let(:collection) { [] }

    it "returns 0 for the #count" do
      expect(subject.count).to eq(0)
    end

    it "returns false for #any?" do
      expect(subject.any?).to eq(false)
    end

    describe "#find_by_id" do
      it "returns nil" do
        expect(subject.find_by_id('notfound')).to be_nil
      end
    end
  end
end

