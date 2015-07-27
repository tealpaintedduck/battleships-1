require 'ship'

describe Ship do

	let (:board){ double :board }

  before(:each) do
    @ship = Ship.new('', board)
  end

  it 'can be created with a location' do
    expect(@ship.location).to be_a String
  end

  it 'can be created with a board' do 
  	expect(@ship.board).to be_truthy
  end
end
