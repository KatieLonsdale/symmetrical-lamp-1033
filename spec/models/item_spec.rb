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
    describe 'customers_purchased_count' do
      it 'returns the number of customers who purchased the item' do
        expect(@item_1.customers_purchased_count).to eq(1)
        expect(@item_2.customers_purchased_count).to eq(2)
        expect(@item_6.customers_purchased_count).to eq(0)
      end
    end
  end
end
