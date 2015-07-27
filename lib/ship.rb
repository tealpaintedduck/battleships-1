class Ship
  attr_reader :location, :type

  def initialize(type, location)
    fail 'Incorrect ship type' unless ship_types.has_key?(type)
    @location = location
    @type = type
  end

  def ship_types
    {patrol_boat: 2, destroyer: 3, submarine: 3, battleship: 4, aircraft_carrier: 5}
  end

end
