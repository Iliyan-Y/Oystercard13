class Journey
  MINIMUM_FARE = 1
  PENALTY_FARE = 6
  attr_reader :entry_station, :exit_station, :journey_history

  def initialize
    @entry_station
    @exit_station
    @journey_history = nil
  end

  def create_trip
    @journey_history = {:entry_station => @entry_station, :exit_station => @exit_station}
    @entry_station = nil
    @exit_station = nil
  end

  def start_trip(station)
    @entry_station = station
  end

  def end_trip(station)
    @exit_station = station
  end

  def fare
    create_trip
    if @journey_history[:exit_station] == nil
      return PENALTY_FARE
    elsif @journey_history[:entry_station] == nil
      return PENALTY_FARE
    else
      return MINIMUM_FARE
    end
  end

  def in_journey?
    !!entry_station
  end

end
