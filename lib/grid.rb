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
    alphabet_numbers = (0..25).to_a
    letter_numbers = {}
    alphabet.each_with_index do |value, index|
      letter_numbers[value] = alphabet_numbers[index]
    end

    coord_arr = coordinate.to_s.split('')
    x_letter = coord_arr[0]
    y_number = coord_arr[1]

    @x = letter_numbers[x_letter.upcase]
    @y = (y_number.to_i - 1)

    conversion = [[@x][@y]]
  end

  def insert_ship(ship, coordinate)
    coordinate_converter(coordinate)
    matrix[@x][@y] = ship
  end

end

#
#
# alphabet.zip(alphabet_numbers).
# p a
#
#
# @sample_array = ["one", "Two", "Three"]
# alphabet = ("a".."z").to_a
#
# @timesheet_id_array = ["96", "97", "98"]
# alphabet_numbers = (1..26).to_a
#
# I want to output the results into a hash called @hash_array. Is there a simple way to combine the two in a code block so that if you call puts at the end it looks like this in the console


#
# @hash_array = {}
# @sample_array.each_with_index do |value, index|
#   @hash_array[value] = @timesheet_id_array[index]
# end
