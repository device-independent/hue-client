require File.expand_path('../../../../../../lib/hue/client/models/whitelist_users', __FILE__)

describe Hue::Client::Models::WhitelistUsers do
  let(:attributes) do

    {
      "D4A6DE78C85349F6219BF81C61B639A0"=> {
        "name"=> "HueDisco",
        "create date"=> "2014-01-22T02:15:42",
        "last use date"=> "2014-02-25T16:54:10"
      },
      "0f607264fc6318a92b9e13c65db7cd3c"=> {
        "name"=> "iPhone",
        "create date"=> "2014-04-05T01:54:18",
        "last use date"=> "2014-04-05T02:15:40"
      },
      "nateklaiber"=> {
        "name"=> "CLI",
        "create date"=> "2014-02-24T23:32:04",
        "last use date"=> "2014-06-04T18:05:24"
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
      it "returns the record with the specified ID" do
        expect(subject.find_by_id('D4A6DE78C85349F6219BF81C61B639A0')).to_not be_nil
      end
    end

    describe "#sort" do
      it "returns the groups sorted by #updated_at" do
        expect(subject.sort.map(&:name)).to eq(['HueDisco', 'iPhone', 'CLI'])
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
