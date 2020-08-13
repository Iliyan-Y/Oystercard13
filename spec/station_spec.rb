require 'station'

describe Station do
  it "Expects station to have a name" do
    station = Station.new("name", 1)
    expect(station.name).to eq ("name")
  end

  it "Expects station to have a zone" do
    station = Station.new("name", 1)
    expect(station.zone).to eq (1)
  end
end
