require 'grid'

describe Grid do
  it 'is initialized with a 2d array full of :x\'s' do
    grid = Grid.new(10)
    expect(grid.matrix[9][9]).to eq(:x)
  end

  it 'can be initialized with different sizes' do
    grid = Grid.new(5)
    expect(grid.matrix.flatten.count(:x)).to eq 25
  end
end
