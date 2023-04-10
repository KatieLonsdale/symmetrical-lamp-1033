require 'rails_helper'

RSpec.describe Supermarket, type: :model do
  describe 'relationships' do
    it { should have_many :items }
    it {should have_many(:customers).through(:items)}
  end

  describe 'instance methods' do
    before :each do
      test_data
    end
    describe 'customer_names' do
      it 'returns an array of unique customers who have shopped there' do
        expect(@supermarket_1.customer_names.sort).to eq(['Katie', 'Max'])
        expect(@supermarket_2.customer_names.sort).to eq(['Lily', 'Max', 'Sara'])
        expect(@supermarket_3.customer_names).to eq([])
      end
    end
  end
end