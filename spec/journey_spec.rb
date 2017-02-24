require 'journey'
require 'oystercard'

describe Journey, :j do
  subject(:card) {Oystercard.new}
  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}
  subject(:journey) {described_class.new}
  before(:each) {card.top_up(3)}

  context "when touching in" do
    before do
      journey.save_entry_station(entry_station)
    end

    it "saves entry data when card is touched in" do
      expect(journey.entry_station).to eq entry_station
    end

    it "sets in_journey to true" do
      expect(journey.in_journey?).to eq true
    end
  end

  context "when touching out" do

    it "saves the exit station" do
      journey.save_exit_station(exit_station)
      expect(journey.exit_station).to eq(exit_station)
    end

    it "sets entry station to nil" do
      journey.save_entry_station(entry_station)
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

    it "charges them the minimum fare if they have touched in" do
      journey.save_entry_station(entry_station)
      expect(journey.fare).to eq described_class::MIN_FARE
    end

    it "charges them the penalty fare if they haven't touched in" do
      journey.save_exit_station(exit_station)
      expect(journey.fare).to eq described_class::PENALTY_FARE
    end
  end


end
