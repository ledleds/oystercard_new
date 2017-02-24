require_relative 'journey'

class Oystercard
attr_reader :balance, :journey_history, :journey

  def initialize
    @balance = 0
    @journey_history = []
    @current_journey = {}
  end

  LIMIT = 90
  MIN_BALANCE = 1
  # MIN_FARE = 3#JOURNEY

  def top_up(money)
    fail "The maximum amount is: £#{LIMIT}." if money > LIMIT
    @balance += money
  end

  def touch_in(station)
    check_balance
    @journey = Journey.new(station)
    @current_journey[:entry_station] = @journey.entry_station
  end

  def touch_out(station)
    deduct(@journey.fare)#journey deduct(@journey.fare) if @journey.touched_in
    @journey.save_exit_station(station)
    @current_journey[:exit_station] = @journey.exit_station
    @journey_history << @current_journey
  end


  def check_balance
    fail "The minimum balance needed for your journey is £#{MIN_BALANCE}" unless @balance > MIN_BALANCE
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end
