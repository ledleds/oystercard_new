class Journey
  attr_reader :exit_station, :entry_station

  PENALTY_FARE = 6
  MIN_FARE = 3

  def initialize
    @touched_in = false
    @journey_done = false
  end

  def save_entry_station(station)
    @entry_station = station
    @touched_in = true
  end

  def save_exit_station(station)
    @exit_station = station
    journey_complete
  end

  def journey_complete
    if @touched_in == true && @exit_station
      @journey_done = true
    end
    @entry_station = nil
    @touched_in = false
  end

  def in_journey?
    !!@entry_station
  end

  def fare
    # return PENALTY_FARE unless @entry_station && @exit_station
    if @journey_done#@touched_in || @in_journey && @touched_in
      MIN_FARE
    else
      PENALTY_FARE
    end
  end
end
