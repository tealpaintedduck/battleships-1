require 'grid'

describe Grid do

  # let(:ship) {double(:ship, {:length => 2, :coordinate => "B2", :orientation => :H})}



  it 'is initialized with a 2d array full of \':x\'s' do
    grid = Grid.new(10)
    expect(grid.matrix[9][9]).to eq(:x)
  end

  it 'can be initialized with different sizes' do
    grid = Grid.new(5)
    expect(grid.matrix.flatten.count(:x)).to eq 25
  end

  it "Can convert coordinates" do
    grid = Grid.new(10)
    expect(grid.coordinate_converter("B2")).to eq ([[1][1]])
  end

  describe "#insert_ship" do
    it "takes ship and coordinate and places it in the grid" do
      grid = Grid.new(10)
      grid.insert_ship(:ship, 2, "B2", :H)
      expect(grid.matrix[1][1]).to eq :ship
    end


    context "when horizontal" do
      it "takes a longer ship and puts it in more than one coordinate" do
        grid = Grid.new(10)
        grid.insert_ship(:ship, 2, "B2", :H)
        expect(grid.matrix[2][1]).to eq :ship
      end
    end

    context "when vertical" do
      it "takes a longer ship and puts it in more than one coordinate" do
        grid = Grid.new(10)
        grid.insert_ship(:ship, 2, "B2", :V)
        expect(grid.matrix[1][2]).to eq :ship
      end
    end
  end

end
