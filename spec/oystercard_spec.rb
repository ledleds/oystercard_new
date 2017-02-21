require 'oystercard'

describe Oystercard do
  subject(:card) {described_class.new}

  describe "#top_up", :top_up do
    it "responds to top_up" do
      expect(card).to respond_to(:top_up)
    end
  end

  describe "#balance", :balance do
    it "has a balance" do
      expect(card.balance).not_to be nil
    end

    it "has a default balance" do
      expect(card.balance).to eq 0
    end

    it "puts money on card" do
      card.top_up(10)
      expect(card.balance).to eq 10
    end

    it "has a maximum limit" do
      over_limit = 91
      expect{card.top_up(over_limit)}.to raise_error "#{over_limit} is over #{Oystercard::LIMIT}."
    end

    it "deducts a fare from the card" do
      card.deduct(5)
      expect(card.balance).to eq(-5)
    end

    it "responds to touch_in" do
      expect(card).to respond_to(:touch_in)
    end

    it "adds the card to the in_transit array" do
      new_card = Oystercard.new
      expect(card.touch_in(new_card)).to include(new_card)
    end

    it "responds to in_journey?" do
      expect(card).to respond_to(:in_journey?)
    end

    it "returns a boolean value" do
      card.touch_in(card)
      expect(card.in_journey?).to be true
    end

    it "removes card from in_transit array" do
        new_card = Oystercard.new
        card.touch_in(new_card)
        expect(card.touch_out).to eq(new_card)
    end

  end

end
