require 'board'

describe Board do
  let(:ship) { double :ship }
  let(:ship_with_location) { double :ship, starting_location: 'A1', direction: :H }

  it 'has place_ship method' do
    expect(subject).to respond_to :place_ship
  end

  describe '#place_ship' do
    it 'takes a ship' do
      expect(subject).to respond_to(:place_ship).with(2).argument
    end

    it 'doesn\'t let you place off board' do
    expect { subject.place_ship(ship, 'Z23') }.to raise_error "Invalid placement - Not on board"
    end

    it 'places a ship on the board' do
      subject.place_ship(ship, 'A1')
      expect(subject.ships.keys.include?(ship)).to be true
    end

    it 'knows a ships physcial location' do
      subject.place_ship(ship, 'A1')
      expect(subject.ships.values.include?('A1')).to be true
    end

    xit 'should generate cell locations from start point' do
      suject.place_ship(ship_with_location, 'A1')
      expect
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
      subject.place_ship(ship_with_location, 'A1')
      expect { subject.fire('A2') }.to raise_error 'Miss!'
    end

    it "returns 'HIT!' if a ship does exist at that location" do
      subject.place_ship(ship_with_location, 'A1')
      expect(subject.fire('A1')).to eq 'HIT!'
    end
  end
end
