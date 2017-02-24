class Journey
  attr_reader :exit_station, :entry_station

  PENALTY_FARE = 6
  MIN_FARE = 3

  def initialize(station)
    @entry_station = station
    @touched_in = true
  end

  def save_exit_station(station)
    @exit_station = station
    @entry_station = nil
    @touched_in = false
  end

  def in_journey?
    !!@entry_station
  end

  def fare
    # No test for this method yet!
    if @touched_in
      MIN_FARE
    else PENALTY_FARE

    end
  end
end
