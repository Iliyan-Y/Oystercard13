require_relative "journeylog"

class Journey
  MINIMUM_FARE = 1
  PENALTY_FARE = 6
  attr_reader :entry_station, :exit_station, :journey_history

  def initialize
    @entry_station
    @exit_station
    @journey_history
    @journey_log = JourneyLog.new
  end

  def create_trip
    @journey_history = {:entry_station => @entry_station, :exit_station => @exit_station}
  end

  def start_trip(station)
    @entry_station = station
  end

  def end_trip(station)
    @exit_station = station
  end

  def fare
    create_trip
    add_journey  
    calc_penalty_fare  
  end

  def add_journey
    @journey_log.add_journey(@journey_history)
  end

  def calc_penalty_fare
    if @journey_history[:exit_station] == "Incomplete Journey" || @journey_history[:entry_station] == "Incomplete Journey"
      return PENALTY_FARE
    else
      return zone_calc
    end
  end

  def zone_calc
    zone_fare = MINIMUM_FARE + (@entry_station.zone - @exit_station.zone).abs
    @entry_station = nil
    zone_fare
  end

  def log 
    @journey_log.journeys
  end

  def in_journey?
    !!entry_station
  end

end
