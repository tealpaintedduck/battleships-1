require_relative './ship.rb'

class Board
  attr_reader :ships

  def initialize
    @ships = {}
  end

  def place_ship(ship, starting_location)
    valid_placement?(starting_location)
    calculate_ship_location(ship, starting_location)
    #ships.merge!(ship => starting_location)
  end

  def fire(position)
    if ships.values.flatten.any? { |location| location == position }
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

  def calculate_ship_location(ship, starting_location)
    placement_array = [starting_location]
    location_array = starting_location.scan(/\d+|\D+/)
    letter = location_array[0]
    number = location_array[1].to_i
    (ship.size - 1).times do
      number += 1
      placement_array << "#{letter}#{number}"
    end
    ships.merge!(ship => placement_array)

  end

end
