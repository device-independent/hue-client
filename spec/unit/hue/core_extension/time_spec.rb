require File.expand_path('../../../../../lib/hue/core_extension/time', __FILE__)
require 'timecop'

describe Hue::CoreExtension::Time do
  let(:timezone) { 'America/New_York' }
  let(:local_time) { Time.local(2008, 9, 1, 10, 5, 0) }
  let(:time) { Timecop.freeze(local_time) }

  subject { time.extend(described_class) }

  it "returns the time with specified timezone" do
    expected = Time.local(2008, 9, 1, 5, 5, 0)
    expect(subject.to_zone(timezone)).to eq(expected)
  end

  # NOTE: We may want to let the exception bubble up...
  it "returns the original time if invalid timezone passed" do
    expect(subject.to_zone('invalid-zone')).to eq(local_time)
  end
end
