class Ship
  attr_reader :starting_location, :type, :size, :direction

  def initialize(type, direction)
    fail 'Incorrect ship type' unless valid_ship_type?(type)
    fail 'Direction must be :H, :V' unless valid_direction?(direction)
    @direction = direction
    @size = ship_types[type]
  end

  def ship_types
    { patrol_boat: 2, destroyer: 3, submarine: 3, battleship: 4, aircraft_carrier: 5 }
  end

  def valid_ship_type?(type)
    ship_types.key?(type)
  end

  def valid_direction?(direction)
    [:H, :V].include? direction
  end
end
