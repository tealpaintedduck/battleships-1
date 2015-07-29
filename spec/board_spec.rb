require 'board'

describe Board do
  let(:horizontal_ship) { double :ship, size: 4, direction: :H }
  let(:vertical_ship) { double :ship, size: 4, direction: :V }

  it 'has place_ship method' do
    expect(subject).to respond_to :place_ship
  end

  describe '#place_ship' do
    it 'takes a ship' do
      expect(subject).to respond_to(:place_ship).with(2).argument
    end

    xit 'doesn\'t let you place off board' do
    expect { subject.place_ship(horizontal_ship, 'Z23') }.to raise_error "Invalid placement - Not on board"
    end

    it 'doesn\'t let physical location go off board' do
      expect { subject.place_ship(horizontal_ship, 'A10') }.to raise_error 'Location not on board'
    end

    it 'places a ship on the board' do
      subject.place_ship(horizontal_ship, 'A1')
      expect(subject.ships.keys.include?(horizontal_ship)).to be true
    end

    it 'should generate cell locations from start point horizontally' do
      subject.place_ship(horizontal_ship, 'A1')
      expect(subject.ships.values.include?(['A1','A2','A3','A4'])).to be true
    end

    it 'should generate cell location from start point vertically' do
      subject.place_ship(vertical_ship, 'A1')
      expect(subject.ships.values.include?(['A1', 'B1', 'C1', 'D1'])).to be true
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
      subject.place_ship(horizontal_ship, 'A1')
      expect { subject.fire('B2') }.to raise_error 'Miss!'
    end

    it "returns 'HIT!' if a ship does exist at that location" do
      subject.place_ship(horizontal_ship, 'A1')
      expect(subject.fire('A1')).to eq 'HIT!'
    end

    it "records a hit" do
      subject.place_ship(horizontal_ship, 'A1')
      subject.fire('A1')
      expect(subject.ships[horizontal_ship].include?(['H','A2','A3','A4'])).to be true
    end

  end
end
