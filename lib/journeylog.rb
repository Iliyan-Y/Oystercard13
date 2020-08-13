class JourneyLog

 attr_reader :journeys

  def initialize
    @journeys = []
  end

  def add_journey(journey)
    @journeys << current_journey(journey)
  end

  private
  def current_journey(journey)
    if journey[:entry_station] == nil
      journey[:entry_station] = "Incomplete Journey"
    elsif journey[:exit_station] == nil
      journey[:exit_station] = "Incomplete Journey"
    end
  end
end
