class Grid
  attr_accessor :matrix, :size

  def initialize(size)
    @size = size
    @matrix = matrix_builder(size)
  end

  def matrix_builder(size)
     (0...size).map{ |a|Array.new(size, :x) }
  end

  def coordinate_converter(coordinate)

    alphabet = ("A".."Z").to_a
    letter_numbers = {}
    alphabet.each_with_index {|item, index| letter_numbers[item] = index}

    coord_arr = coordinate.to_s.split('')
    x_letter = coord_arr[0]
    y_number = coord_arr[1]

    @y = letter_numbers[x_letter.upcase]
    @x = (y_number.to_i - 1)

    conversion = [[@x][@y]]
  end

  def insert_ship(ship, length, coordinate, orientation)
    coordinate_converter(coordinate)

    if length == 2 && orientation == :H
      matrix[@x][@y] = ship
      matrix[@x+1][@y] = ship
    end

    if length == 2 && orientation == :V
      matrix[@x][@y] = ship
      matrix[@x][@y+1] = ship
    end
  end

end
