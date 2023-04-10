require 'rails_helper'

RSpec.describe 'Supermarkets show page' do
  before :each do
    test_data
  end
  describe "As a visitor, when I visit a supermarket's show page" do
    it "shows me a list of customers who have shopped there" do
      visit "/supermarkets/#{@supermarket_1.id}"

      expect(page).to have_content(@customer_1.name, count: 1)
      expect(page).to have_content(@customer_2.name, count: 1)
      expect(page).to have_no_content(@customer_5.name)

      visit "/supermarkets/#{@supermarket_2.id}"

      expect(page).to have_content(@customer_5.name, count: 1)
      expect(page).to have_no_content(@customer_1.name)
    end
  end

end