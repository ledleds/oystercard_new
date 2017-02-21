require 'oystercard'

describe Oystercard do
  subject(:card) {described_class.new}

  describe "#top_up", :top_up do
    it "responds to top_up" do
      expect(card).to respond_to(:top_up)
    end

    it "puts money on card" do
      card.top_up(10)
      expect(card.balance).to eq 10
    end
  end

  describe "#balance" do
    it "has a balance" do
      expect(card.balance).not_to be nil
    end

    it "has a default balance" do
      expect(card.balance).to eq 0
    end

    it "has a maximum limit" do
      expect{card.top_up(91)}.to raise_error "The maximum amount is: £#{Oystercard::LIMIT}."
    end

    it "deducts a fare from the card" do
      card.deduct(5)
      expect(card.balance).to eq(-5)
    end
  end

    describe "touch in/ out" do
      before(:each) do
        card.top_up(10)
      end

      it "responds to touch_in" do
        expect(card).to respond_to(:touch_in)
      end

      it "adds the card to the in_transit array" do

        expect(card.touch_in(card)).to include(card)
      end

      it "removes card from in_transit array" do
        card.touch_in(card)
        expect(card.touch_out).to eq(card)
      end

      it "returns a boolean value" do
        card.touch_in(card)
        expect(subject.in_journey?).to be true
      end

      it "responds to check_balance" do
        expect(card).to respond_to(:check_balance)
      end

      context "When balance is below the minimum" do

        it "returns an error when balance is less than the minimum" do
          card.deduct(10) 
          error = "The minimum balance needed for your journey is £#{Oystercard::MIN}"
          expect{card.touch_in(card)}.to raise_error error
        end
      end



    end
  end
