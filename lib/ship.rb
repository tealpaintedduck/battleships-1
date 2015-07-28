class Ship
  attr_reader :location, :type, :size, :direction

  def initialize(type, location, direction)
    fail 'Incorrect ship type' unless valid_ship_type?(type)
    fail 'Direction must be :N, :S, :E or :W' unless valid_direction?(direction)
    @location = location
    @direction = direction
    @type = type
    @size = ship_types[type]
  end

  def ship_types
    { patrol_boat: 2, destroyer: 3, submarine: 3, battleship: 4, aircraft_carrier: 5 }
  end

  def valid_ship_type?(type)
    ship_types.key?(type)
  end

  def valid_direction?(direction)
    [:N, :S, :E, :W].include? direction
  end
end
