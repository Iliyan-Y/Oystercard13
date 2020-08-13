class JourneyLog

attr_reader :journeys

  def initialize(journey)
    @journey = journey
    @journeys = []
  end

  def journeys
    @journeys << @journey.journey_history
  end
end
