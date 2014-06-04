require File.expand_path('../../../../../../lib/hue/client/models/whitelist_user', __FILE__)

describe Hue::Client::Models::WhitelistUser do

  let(:attributes) do
    {
      "id" => "1234567890",
      "last use date"=> "2010-10-17T01:23:20",
      "create date"=> "2010-10-17T01:23:20",
      "name"=> "iPhone Web 1"
    }
  end

  subject { described_class.new(attributes) }

  context "with values" do
    it "returns the #id" do
      expect(subject.id).to eq('1234567890')
    end

    it "returns the #name" do
      expect(subject.name).to eq('iPhone Web 1')
    end

    it "returns the #create_date as a string" do
      expect(subject.create_date).to eq('2010-10-17T01:23:20')
    end

    it "returns the #created_at as a DateTime" do
      expected = Time.local(2010, 10, 17, 1, 23, 20)
      expect(subject.created_at).to eq(expected)
    end

    it "returns the #last_use_date as a string" do
      expect(subject.last_use_date).to eq('2010-10-17T01:23:20')
    end

    it "returns the #last_used_at as a DateTime" do
      expected = Time.local(2010, 10, 17, 1, 23, 20)
      expect(subject.last_used_at).to eq(expected)
    end
  end
end
