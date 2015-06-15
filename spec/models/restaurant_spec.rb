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

end