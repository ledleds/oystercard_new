require 'journey'
require 'oystercard'

describe Journey do
  subject(:card) {Oystercard.new}
  let(:entry_station) {double :entry_station}
  subject(:journey) {described_class.new(entry_station)}
  before(:each) {card.top_up(3)}

  #start
  it "saves entry data when card is touched in" do
    card.touch_in(entry_station) #this should instantiate journey
    expect(journey.entry_station).to eq entry_station
  end
  #finish
  #calculate
  #complete

end
