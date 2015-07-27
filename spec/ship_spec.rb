require 'ship'

describe Ship do

	# let (:board){ double :board }

  before(:each) do
    @ship = Ship.new(:battleship, 'location', :N)
  end

  it 'can be created with a location' do
    expect(@ship.location).to be_a String
  end

  it 'can be created with a type' do
    expect(@ship.type).to be_a Symbol
  end

  it 'has a size' do 
    expect(@ship.size).to be_a Integer
  end

  it 'has a direction' do 
    expect(@ship.direction).to be_truthy
  end

  describe "#valid_direction?" do 
    it 'fails if direction is not valid' do 
      expect{Ship.new(:battleship, 'A1', :invalid_direction)}.to raise_error "Direction must be :N, :S, :E or :W"
    end
  end

  it 'type must match one of the ship types' do
    expect { Ship.new('incorrect_type', 'A1', :N) }.to raise_error 'Incorrect ship type'
  end

  it 'has a method called ship_types' do
    expect(@ship).to respond_to :ship_types
  end

  describe '#ship_types' do
    it 'returns a hash' do
      expect(@ship.ship_types).to be_a Hash
    end
  end
end
