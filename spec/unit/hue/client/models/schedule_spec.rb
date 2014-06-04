require File.expand_path('../../../../../../lib/hue/client/models/schedule', __FILE__)

describe Hue::Client::Models::Schedule do
  let(:attributes) do
    {
      "id" => "1207463055331812",
      "name"=> "Wake up",
      "description"=> "My wake up alarm",
      "command"=> {
        "address"=> "/api/<username>/groups/1/action",
        "method"=> "PUT",
        "body"=> {
          "on"=> true
        }
      },
      "time"=> "W124/T10:55:00",
      "localtime" => "W124/T06:55:00",
      "created" => "2014-03-10T14:10:53",
      "status" => "enabled"
    }
  end

  subject { described_class.new(attributes) }

  context "with values" do
    it "returns the #id" do
      expect(subject.id).to eq('1207463055331812')
    end

    it "returns the #name" do
      expect(subject.name).to eq('Wake up')
    end

    it "returns the #description" do
      expect(subject.description).to eq('My wake up alarm')
    end

    it "returns the #time" do
      expect(subject.time).to eq('W124/T10:55:00')
    end

    it "returns the #trigger_at timestamp" do
      expected = Time.local(2014, 6, 4, 10, 55, 0)
      expect(subject.trigger_at).to eq(expected)
    end

    it "returns the #local_time" do
      expect(subject.local_time).to eq('W124/T06:55:00')
    end

    it "returns the #local_trigger_at" do
      expected = Time.local(2014, 6, 4, 6, 55, 0)
      expect(subject.local_trigger_at).to eq(expected)
    end

    it "returns the #created_at timestamp" do
      expected = Time.local(2014, 3, 10, 14, 10, 53)
      expect(subject.created_at).to eq(expected)
    end

    it "returns the #status" do
      expect(subject.status).to eq('enabled')
    end

    it "returns true for #enabled?" do
      expect(subject).to be_enabled
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

    it "returns the #description" do
      expect(subject.description).to be_nil
    end

    it "returns the #time" do
      expect(subject.time).to be_nil
    end

    it "returns the #trigger_at timestamp" do
      expect(subject.trigger_at).to be_nil
    end

    it "returns the #local_time" do
      expect(subject.local_time).to be_nil
    end

    it "returns the #local_trigger_at" do
      expect(subject.local_trigger_at).to be_nil
    end

    it "returns the #created_at timestamp" do
      expect(subject.created_at).to be_nil
    end

    it "returns the #status" do
      expect(subject.status).to eq('disabled')
    end

    it "returns false for #enabled?" do
      expect(subject).to_not be_enabled
    end
  end
end
