class Ship
  attr_reader :location
  attr_reader :board

  def initialize(location, board)
    @location = location
    @board = board
  end
end
