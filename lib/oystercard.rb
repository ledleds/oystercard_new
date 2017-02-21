class Oystercard
attr_reader :balance

  def initialize
    @balance = 0
    @in_transit = []
  end

  LIMIT = 90
  MIN = 1

  def top_up(money)
    fail "The maximum amount is: £#{LIMIT}." if money > LIMIT
     @balance += money
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in(card)
    check_balance
    @in_transit << card
  end

  def touch_out
    @in_transit.pop
  end

  def in_journey?
    @in_transit.size > 0
  end

  def check_balance
    fail "The minimum balance needed for your journey is £#{MIN}" unless @balance > MIN
  end

end
