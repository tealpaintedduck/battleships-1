require 'ship'

describe Ship do
  before(:each) do
    @ship = Ship.new(:battleship)
  end

  it 'generates size based on ship type' do
    expect(@ship.size).to eq 4
  end

  it 'has a size' do
    expect(@ship.size).to be_a Integer
  end

  it 'type must match one of the ship types' do
    expect { Ship.new('incorrect_type') }.to raise_error 'Incorrect ship type'
  end

  it 'has a method called ship_types' do
    expect(@ship).to respond_to :ship_types
  end

  describe '#ship_types' do
    it 'returns a hash' do
      expect(@ship.ship_types).to be_a Hash
    end
  end

  it "loses hp when fired at" do
    start_hp = @ship.hp
    @ship.gets_hit
    expect(@ship.hp).to eq(start_hp - 1)
  end
end
