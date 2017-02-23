require 'station'

describe Station do
  subject(:station) {described_class.new(name: "Angel", zone: 1)}

  it "has a name" do
    expect(station.station_name).to eq "Angel"
  end

  it "has a zone" do
    expect(station.zone).to eq 1
  end
end
