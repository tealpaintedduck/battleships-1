require 'board'

describe Board do
  let(:horizontal_ship) { double :ship, size: 4, direction: :H, gets_hit: nil, has_sunk?: nil, hp: 0 }
  let(:vertical_ship) { double :ship, size: 4, direction: :V, gets_hit: nil, has_sunk?: nil }
  let(:small_ship) { double :ship, size: 2, direction: :H, gets_hit: nil, has_sunk?: nil, hp: nil }
   let(:sunk_ship) { double :ship, size: 2, direction: :H, gets_hit: nil, has_sunk?: true, hp: 0 }

  it 'has place_ship method' do
    expect(subject).to respond_to :place_ship
  end

  describe '#place_ship' do
    it 'takes a ship' do
      expect(subject).to respond_to(:place_ship).with(3).argument
    end

    it "doesn't let you place ship on top of other ship" do
      subject.place_ship(horizontal_ship,"A1", :H)
      expect{subject.place_ship(small_ship,"A1", :H)}.to raise_error "Ships cannot overlap."
    end

    it 'doesn\'t let you place off board' do
    expect { subject.place_ship(horizontal_ship, 'Z23', :H) }.to raise_error "Location not on board"
    end

    it 'doesn\'t let physical location go off board' do
      expect { subject.place_ship(horizontal_ship, 'A10', :H) }.to raise_error 'Location not on board'
    end

    it 'places a ship on the board' do
      subject.place_ship(horizontal_ship, 'A1', :H)
      expect(subject.ships.keys.include?(horizontal_ship)).to be true
    end

    it 'should generate cell locations from start point horizontally' do
      subject.place_ship(horizontal_ship, 'A1', :H)
      expect(subject.ships.values.include?(['A1','A2','A3','A4'])).to be true
    end

    it 'should generate cell location from start point vertically' do
      subject.place_ship(vertical_ship, 'A1', :V)
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

    it "returns 'Miss!' if a ship doesn't exist at that location" do
      subject.place_ship(horizontal_ship, 'A1', :horizontal)
      expect(subject.fire('B2')).to eq 'Miss!'
    end

    it "returns 'HIT!' if a ship does exist at that location" do
      subject.place_ship(horizontal_ship, 'A1', :horizontal)
      expect(subject.fire('A1')).to eq 'HIT!'
    end
  end

    it "should record hits" do
      subject.place_ship(horizontal_ship, "A1", :horizontal)
      subject.fire("A1")
      expect(subject.recorded_shots).to include "A1" => "H"
    end

    it "should record misses" do
      subject.fire("A1")
      expect(subject.recorded_shots).to include "A1" => "M"
    end

    it "should only be able to hit cell once" do
      subject.fire("A1")
      expect(subject.fire("A1")).to eq "Location already targeted."
    end

    it "should remove sunk ships from board" do
      subject.place_ship(sunk_ship, "A1", :horizontal)
      subject.fire("A1")
      expect(subject.ships.include?(small_ship)).to be false
    end

end
