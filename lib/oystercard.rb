require_relative 'journey'
require_relative 'station'

class Oystercard

  attr_reader :balance, :counter, :journey

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @journey = Journey.new
    @counter = 1
  end

  def top_up(amount)
    fail "The maximum limit is £90" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "You need to top up" if @balance < MIN_BALANCE
    @journey.start_trip(station)
    if @counter > 1
      deduct(@journey.fare)
    end
    @counter += 1
  end

  def touch_out(station)
    @journey.end_trip(station)
    deduct(@journey.fare)
    @counter = 1
  end

  def log
    @journey.log
  end


  private

  def deduct(amount)
    @balance -= amount
  end

end
