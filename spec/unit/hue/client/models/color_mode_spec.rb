require File.expand_path('../../../../../../lib/hue/client/models/color_mode', __FILE__)

describe Hue::Client::Models::ColorMode do
  let(:mode) { 'hs' }

  subject { described_class.new(mode) }

  context "with values" do
    describe "hs" do
      it "returns 'hs' as the #name" do
        expect(subject.name).to eq('hs')
      end

      it "returns 'Hue and Saturation' as the #description" do
        expect(subject.description).to eq('Hue and Saturation')
      end
    end

    describe "xy" do
      let(:mode) { 'xy' }

      it "returns 'xy' as the #name" do
        expect(subject.name).to eq('xy')
      end

      it "returns 'XY' as the #description" do
        expect(subject.description).to eq('XY')
      end
    end

    describe "ct" do
      let(:mode) { 'ct' }

      it "returns 'ct' as the #name" do
        expect(subject.name).to eq('ct')
      end

      it "returns 'Color Temperature' as the #description" do
        expect(subject.description).to eq('Color Temperature')
      end
    end

    describe "unknown" do
      let(:mode) { 'unknown' }

      it "returns 'unknown' as the #name" do
        expect(subject.name).to eq('unknown')
      end

      it "returns 'Unknown' as the #description" do
        expect(subject.description).to eq('unknown')
      end
    end
  end
end
