class Journey
  attr_reader :exit_station, :entry_station

  def initialize(station)
    @entry_station = station
  end

  def save_exit_station(station)
    @exit_station = station
    @entry_station = nil
  end

  def in_journey?
    !!@entry_station
  end
end
