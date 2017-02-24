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

    it "saves entry data" do
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

    it "sets in_journey to false" do
      journey.save_exit_station(exit_station)
      expect(journey.in_journey?).to eq false
    end
  end

  context "calculating fare" do
    it 'responds to fare' do
      expect(journey).to respond_to(:fare)
    end

    context "when touched in" do
      before do
        journey.save_entry_station(entry_station)
      end

      it "charges them the minimum fare" do
        journey.save_exit_station(exit_station)
        expect(journey.fare).to eq described_class::MIN_FARE
      end

      it 'charges a pentaly fare when they touch in again' do
        journey.save_entry_station(entry_station) #second touch in
        expect(journey.fare).to eq described_class::PENALTY_FARE
      end
    end

    context "when not touched in" do
      it "charges them the penalty fare" do
        journey.save_exit_station(exit_station)
        expect(journey.fare).to eq described_class::PENALTY_FARE
      end
    end

    context "when journey complete" do

      it "sets entry station to nil" do
        p journey.save_entry_station(entry_station)
        expect{journey.save_exit_station(exit_station)}.to change {journey.entry_station}.to nil
      end
    end
  end


end
