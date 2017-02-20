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

    it "increases the balance when topped up" do
      card.top_up(10)
      expect(card.balance).to eq 10
    end
  end

end
