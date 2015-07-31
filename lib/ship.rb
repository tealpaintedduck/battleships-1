class Ship
  attr_reader :starting_location, :type, :size, :direction, :hp

  def initialize(type)
    fail 'Incorrect ship type' unless valid_ship_type?(type)
    @size = ship_types[type]
    @hp = size
  end

  def set_type
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

  def gets_hit
    @hp -= 1
  end

  def has_sunk?
    @hp == 0
  end
end
