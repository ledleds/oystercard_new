require 'oystercard'

describe Oystercard do
  subject(:card) {described_class.new}

  it "responds to top_up" do
    expect(card).to respond_to(:top_up)
  end

  it "has a balance" do
    expect(card.balance).not_to be nil
  end

  it "has a default balance" do
    expect(card.balance).to eq 0
  end


end
