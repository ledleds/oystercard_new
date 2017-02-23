class Oystercard
attr_reader :balance, :entry_station, :exit_station, :journey_history

  def initialize
    @balance = 0
    @journey_history = []
    @entry_station = nil
    @exit_station = nil
  end

  LIMIT = 90
  MIN = 1
  MIN_FARE = 3

  def top_up(money)
    fail "The maximum amount is: £#{LIMIT}." if money > LIMIT
    @balance += money
  end

  def touch_in(station)
    check_balance
    @entry_station = station
    # @in_transit << card
  end

  def touch_out(station)
    deduct(MIN_FARE)
    @exit_station = station
    @journey_history << {
      :entry_station => @entry_station,
      :exit_station => @exit_station
    }
    @entry_station = nil
  end

  def in_journey?
    !!@entry_station
  end

  def check_balance
    fail "The minimum balance needed for your journey is £#{MIN}" unless @balance > MIN
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end
