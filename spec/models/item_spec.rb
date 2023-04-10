require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }
    it { should have_many :customer_items }
    it { should have_many(:customers).through(:customer_items) }
  end

  describe 'instance methods' do
    before :each do
      test_data
    end
    describe 'supermarket_name' do
      it 'returns the name of the supermarket the item belongs to' do
        expect(@item_1.supermarket_name).to eq('King Soopers')
        expect(@item_2.supermarket_name).to eq('King Soopers')
        expect(@item_4.supermarket_name).to eq('Safeway')
      end
    end
  end
end
