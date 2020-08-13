class JourneyLog

 attr_reader :journeys

  def initialize
    @journeys = []
  end

  def add_journey(current_journey)
    @journeys << current_journey
  end

end
