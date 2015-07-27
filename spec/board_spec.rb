require 'board'

describe Board do

  let(:ship){ double :ship }
  let(:ship_with_location){ double :ship, location: "A1" }

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

	it 'has a fire method' do
		expect(subject).to respond_to :fire
	end

	describe '#fire' do
		it 'has a position as an argument' do
			expect(subject).to respond_to(:fire).with(1).argument
		end

		it "fails if a ship doesn't exist at that location" do
			subject.place_ship(ship_with_location)
			expect{ subject.fire("A2") }.to raise_error "Miss!"
		end

		it "returns 'HIT!' if a ship does exist at that location" do
			subject.place_ship(ship_with_location)
			expect(subject.fire("A1")).to eq "HIT!"
		end
	end

end