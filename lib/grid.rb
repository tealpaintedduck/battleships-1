class Grid
  attr_accessor :matrix, :size  # => nil

  def initialize(size)
    @size = size
    @matrix = matrix_builder(size)
  end

  def matrix_builder(size)
    row = []
    matrix = []
    size.times { row << :x }
    size.times { matrix << row }
    matrix
  end
end