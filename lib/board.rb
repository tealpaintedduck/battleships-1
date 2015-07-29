require_relative './ship.rb'

class Board
  attr_reader :ships

  def initialize
    @ships = {}
  end

  def place_ship(ship, starting_location)
    valid_placement?(starting_location)
    ships.merge!(ship => starting_location)
  end

  def fire(position)
    if ships.values.any? { |location| location == position }
      return 'HIT!'
    else
      fail 'Miss!'
    end
  end

  def valid_placement?(starting_location)
    location_array = starting_location.scan(/\d+|\D+/)
    x = location_array[0]
    y = location_array[1].to_i
    if x <= "J" && y <= 10
      true
    else
      fail 'Invalid placement - Not on board'
    end
  end

end
