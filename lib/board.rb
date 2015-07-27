require_relative './ship.rb'

class Board

	attr_reader :ships

	def initialize 
		@ships = []
	end

	def place_ship(ship)
		ships << ship
	end
end