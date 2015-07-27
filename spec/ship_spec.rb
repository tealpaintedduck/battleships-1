require 'ship'

describe Ship do

	# let (:board){ double :board }

  before(:each) do
    @ship = Ship.new(:battleship, 'location')
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

  it 'type must match one of the ship types' do
    expect { Ship.new('incorrect_type', 'A1') }.to raise_error 'Incorrect ship type'
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
