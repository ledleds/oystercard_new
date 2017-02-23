class Station
attr_reader :station_name, :zone
  def initialize(name: station_name, zone: zone)
    @station_name = name
    @zone = zone
  end
end
