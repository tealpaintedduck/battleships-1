require_relative './ship.rb'

class Board
  attr_reader :ships, :recorded_shots

  def initialize
    @ships = {}
    @recorded_shots = {}
  end

  def place_ship(ship, starting_location, direction)
    #ship.set_direction(direction)
    location_okay?(ship, starting_location, direction)
    ships.merge!(ship => (calculate_ship_location(ship, starting_location, direction)))
  end

  def location_okay?(ship, starting_location, direction)
    location_on_board?(calculate_ship_location(ship, starting_location, direction))
    location_free?(calculate_ship_location(ship, starting_location, direction))
  end

  def location_on_board?(placement_location)
    placement_location.each do |coord|
      fail 'Location not on board' if coord[0] > 'J' || coord[1..-1].to_i > 10 || coord[1..-1].to_i < 1
    end
  end

  def location_free?(placement_location)
    raise "Ships cannot overlap." unless ships.values.flatten & placement_location == []
  end

  def calculate_ship_location(ship, starting_location, direction)
    placement_array = [starting_location]
    (ship.size - 1).times do
      placement_array << get_next_coord(direction, placement_array.last)
    end
    placement_array
  end

  def get_next_coord(direction,coord)
    location_array = coord.scan(/\d+|\D+/)
    letter, number = location_array[0], location_array[1].to_i
    direction == :H ? number += 1 : letter = letter.next
    "#{letter}#{number}"
  end

  def fire(position)
    return "Location already targeted." if recorded_shots.keys.include? position
    target_has_ship?(position) ? ship_is_hit(position) : ship_is_missed(position)
  end

  def target_has_ship?(position)
    ships.values.flatten.any? { |location| location == position }
  end

  def ship_is_hit(position)
    hit_ship = find_ship(position)
    hit_ship.gets_hit
    @recorded_shots.merge!(position => "H")
    ship_sinks(hit_ship) if ship_has_sunk?(hit_ship)
    return 'HIT!'
  end

  def ship_is_missed(position)
    @recorded_shots.merge!(position => "M")
    return 'Miss!'
  end

  def find_ship(position)
    ships.select { |k,v| v.include? position }.keys[0]
  end

  def ship_has_sunk?(ship)
    ship.hp < 1
  end

  def ship_sinks(ship)
    "You've sunk my battleship!"
    ships.delete(ship)
  end

end