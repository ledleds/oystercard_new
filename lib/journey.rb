class Journey
attr_accessor :entry_station, :save_entry_station

  def initialize(station)
    @entry_station = station
  end

  def save_entry_station(station)
    @entry_station = station
  end
end
