require "journeylog"

describe JourneyLog do 

  describe "#journeys" do 
    it "Store the list of the journeys" do 
      expect(subject.journeys.count).to eq 0
    end 
  end

  describe "#add_journey" do 
    it "adds one journey to the array" do 
      journey = {entry_station: "station1", exit_station: "station2"}
      subject.add_journey(journey)
      expect(subject.journeys.count).to eq 1
    end
  end

end