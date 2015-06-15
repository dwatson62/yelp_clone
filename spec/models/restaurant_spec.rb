require 'rails_helper'
require 'spec_helper'

describe Restaurant, type: :model do
  it { is_expected.to have_many :reviews}

  context 'when deleted' do
    it 'all information is deleted' do
      trade = Restaurant.create(name: 'Trade')
      Review.create(thoughts: 'Awesome', rating: '5', restaurant_id: trade.id)
      trade.destroy
      expect(Review.count).to eq 0
    end
  end

  it 'is not valid with a ame of less than three characters' do
    restaurant = Restaurant.new(name: "kf")
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it 'is not valid unless it had a unique name' do
    Restaurant.create(name: "Moe's Tavern")
    restaurant = Restaurant.new(name: "Moe's Tavern")
    expect(restaurant).to have(1).error_on(:name)
  end
end