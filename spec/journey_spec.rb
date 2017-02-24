require 'journey'
require 'oystercard'

describe Journey, :j do
  subject(:card) {Oystercard.new}
  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}
  subject(:journey) {described_class.new(entry_station)}
  before(:each) {card.top_up(3)}

  context "when touching in" do
    it "saves entry data when card is touched in" do
      expect(journey.entry_station).to eq entry_station
    end

    it "sets in_journey to true" do
      expect(journey.in_journey?).to eq true
    end
  end

  #finish

  context "when touching out" do

    it "saves the exit station" do
      journey.save_exit_station(exit_station)
      expect(journey.exit_station).to eq(exit_station)
    end

    it "sets entry station to nil" do
      expect{journey.save_exit_station(exit_station)}.to change {journey.entry_station}.to nil
    end

    it "sets in_journey to false" do
      journey.save_exit_station(exit_station)
      expect(journey.in_journey?).to eq false
    end
  end

  context "calculating fare" do
    it 'responds to fare' do
      expect(journey).to respond_to(:fare)
    end

    xit "charges them the penalty fare if they haven't touched in" do
      #card.touch_out(exit_station)
      expect(journey.fare).to eq "You haven't touched in"#described_class::PENALTY_FARE
    end

  end
  #calculate
  #complete

end
