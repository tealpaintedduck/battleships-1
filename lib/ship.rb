class Ship
  attr_reader :location, :type

  def initialize(type, location)
    @location = location
    @type = type
  end

end
