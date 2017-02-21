class Oystercard
attr_reader :balance

  def initialize
    @balance = 0
    @in_transit = []
  end

  LIMIT = 90

  def top_up(money)
    fail "#{money} is over #{LIMIT}." if money > LIMIT
     @balance += money
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in(card)
    @in_transit << card
  end

  def in_journey?
    @in_transit.size > 0
  end

  def touch_out
    @in_transit.pop
  end

end
