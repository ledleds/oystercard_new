class Oystercard
attr_reader :balance

  def initialize
    @balance = 0
  end

  LIMIT = 90

  def top_up(money)
    fail "#{money} is over #{LIMIT}." if money > LIMIT
     @balance += money
  end



end
