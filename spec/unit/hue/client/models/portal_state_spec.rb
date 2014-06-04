require File.expand_path('../../../../../../lib/hue/client/models/portal_state', __FILE__)

describe Hue::Client::Models::PortalState do
  let(:attributes) do
    {
      "communication" => "connected",
      "outgoing" => true,
      "incoming" => true,
      "signedon" => true
    }
  end

  subject { described_class.new(attributes) }

  context "with values" do
    it "returns the #communication status" do
      expect(subject.communication).to eq('connected')
    end

    it "returns true for #connected?" do
      expect(subject).to be_connected
    end

    it "returns the #outgoing status" do
      expect(subject.outgoing).to be(true)
    end

    it "returns true for #outgoing" do
      expect(subject).to be_outgoing
    end

    it "returns the #incoming status" do
      expect(subject.incoming).to be(true)
    end

    it "returns true for #incoming?" do
      expect(subject).to be_incoming
    end

    it "returns the #signed_on status" do
      expect(subject.signed_on).to be(true)
    end

    it "returns true for #signed_on?" do
      expect(subject).to be_signed_on
    end
  end

  context "without values" do
    let(:attributes) { {} }

    it "returns the #communication status" do
      expect(subject.communication).to eq('disconnected')
    end

    it "returns false for #connected?" do
      expect(subject).to_not be_connected
    end

    it "returns the #outgoing status" do
      expect(subject.outgoing).to be(false)
    end

    it "returns false for #outgoing" do
      expect(subject).to_not be_outgoing
    end

    it "returns the #incoming status" do
      expect(subject.incoming).to be(false)
    end

    it "returns false for #incoming?" do
      expect(subject).to_not be_incoming
    end

    it "returns the #signed_on status" do
      expect(subject.signed_on).to be(false)
    end

    it "returns false for #signed_on?" do
      expect(subject).to_not be_signed_on
    end
  end
end
