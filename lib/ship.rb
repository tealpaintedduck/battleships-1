class Ship
  attr_reader :location, :type, :size, :direction

  def initialize(type, location, direction)
    fail 'Incorrect ship type' unless valid_ship_type?(type)
    fail 'Direction must be :H, :V' unless valid_direction?(direction)
    fail 'Invalid placement - Not on board' unless valid_placement?(location)
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
    [:H, :V].include? direction
  end

  def valid_placement?(location)
    location_array = location.split("")
    x = location_array[0]
    location_array.delete x
    # y = location_array.last((location_array.length) -1).join.to_i
    y = location_array.join.to_i
    if x <= "J" && y <= 10
      true
    else
      false
    end
  end
end
