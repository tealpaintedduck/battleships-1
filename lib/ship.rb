class Ship
  attr_reader :location, :type, :size

  def initialize(type, location)
    fail 'Incorrect ship type' unless valid_ship_type?(type)
    @location = location
    @type = type
    @size = ship_types[type]
  end

  def ship_types
    {patrol_boat: 2, destroyer: 3, submarine: 3, battleship: 4, aircraft_carrier: 5}
  end

  def valid_ship_type?(type)
  	ship_types.has_key?(type)
  end

end
