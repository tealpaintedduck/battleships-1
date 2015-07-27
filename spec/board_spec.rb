require 'board'

describe Board do

	let(:ship){ double :ship }

	it 'has place_ship method' do 
		expect(subject).to respond_to :place_ship
	end

	describe '#place_ship' do 
		it 'takes a ship' do 
			expect(subject).to respond_to(:place_ship).with(1).argument
		end

		it 'places a ship on the board' do 
			subject.place_ship(ship)
			expect(subject.ships.include?(ship)).to be true
		end
	end

end