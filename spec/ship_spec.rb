require 'ship'

describe Ship do

	# let (:board){ double :board }

  before(:each) do
    @ship = Ship.new('type', 'location')
  end

  it 'can be created with a location' do
    expect(@ship.location).to be_a String
  end

  it 'can be created with a type' do
    expect(@ship.type).to be_a String
  end

end
