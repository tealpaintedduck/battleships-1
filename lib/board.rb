require_relative './ship.rb'

class Board
  attr_reader :ships

  def initialize
    @ships = {}
  end

  def place_ship(ship, starting_location)
    # valid_placement?(starting_location)
    calculate_ship_location(ship, starting_location)
  end

  def fire(position)
    if ships.values.flatten.any? { |location| location == position }
      hit_ship = ships.select { |k,v| v.include? position }
      hit_ship.keys[0].gets_got
      return 'HIT!'
    else
      fail 'Miss!'
    end
  end

  # def valid_placement?(starting_location)
  #   location_array = starting_location.scan(/\d+|\D+/)
  #   x = location_array[0]
  #   y = location_array[1].to_i
  #   if x <= "J" && y <= 10
  #     true
  #   else
  #     fail 'Invalid placement - Not on board'
  #   end
  # end

  def calculate_ship_location(ship, starting_location)
    placement_array = [starting_location]
    location_array = starting_location.scan(/\d+|\D+/)
    letter = location_array[0]
    number = location_array[1].to_i
    (ship.size - 1).times do
      ship.direction == :H ? number += 1 : letter = letter.next
      placement_array << "#{letter}#{number}"
    end
    placement_array.each do |coord|
      if coord[0] > 'J' || coord[1..-1].to_i > 10 || coord[1..-1].to_i < 1
        fail 'Location not on board'
      end
    end
    ships.merge!(ship => placement_array)
  end

end
