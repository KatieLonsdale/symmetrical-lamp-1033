require 'rails_helper'

RSpec.describe 'Items index page' do
  before :each do
    test_data
    visit '/items'
  end

  describe 'As a visitor, when I visit the items index page' do
    it "shows me a list of all items and their info" do
      expect(page).to have_content("Name: #{@item_1.name}")
      expect(page).to have_content("Price: #{@item_1.price}")
      expect(page).to have_content("Supermarket: #{@item_1.supermarket_name}")
      expect(page).to have_content("Purchased by #{@item_1.customers_purchased_count} Customers")

      expect(page).to have_content("Name: #{@item_4.name}")
      expect(page).to have_content("Price: #{@item_4.price}")
      expect(page).to have_content("Supermarket: #{@supermarket_2.name}")
      expect(page).to have_content("Purchased by #{@item_4.customers_purchased_count} Customers")
    end
  end
end