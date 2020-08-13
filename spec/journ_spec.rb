require "journey"

describe Journey do
  let(:station_1) { double :station_1, zone: 1 }
  let(:station_2) { double :station_2, zone: 2 }
  let(:station_3) { double :station_2, zone: 3 } 

  it 'is initially not in a journey' do
    expect(subject).not_to be_in_journey
  end

  describe "#start_trip" do
    it 'change status of oystercard in_journey? = true' do
      subject.start_trip("station")
      expect(subject).to be_in_journey
    end
  end

  describe "#end_trip" do

  it 'change status of oystercard in_journey? = false' do
    subject.start_trip(station_1)
    subject.end_trip(station_1)
    subject.fare
    expect(subject).not_to be_in_journey
  end

  end
    
  describe "#fare" do
    it "charges the minimum fare" do
      subject.start_trip(station_1)
      subject.end_trip(station_1)
      expect(subject.fare).to eq Journey::MINIMUM_FARE
    end

    it "Charges the penalty fare it you don't end the trip" do
      subject.start_trip("Old Street")
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end

    it 'charges the correct fare for zones 1 to 2' do
      subject.start_trip(station_1)
      subject.end_trip(station_2)
      expect(subject.fare).to eq 2
    end

  end

end
