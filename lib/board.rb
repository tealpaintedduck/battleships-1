require_relative './ship.rb'

class Board

	attr_reader :ships

	def initialize 
		@ships = []
	end

	def place_ship(ship)
		ships << ship
	end

	def fire(position)
		if ships.any?{ |ship| ship.location == position }
			return "HIT!"
		else
			fail "Miss!"
		end
	end
end