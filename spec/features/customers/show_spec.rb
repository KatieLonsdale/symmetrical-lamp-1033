require 'rails_helper'

RSpec.describe 'Customers show page' do
  before :each do
    test_data
  end

  describe "As a visitor, when I visit a customer show page" do
    it "displays the customer's name" do
      visit "customers/#{@customer_1.id}"
      expect(page).to have_content(@customer_1.name)

      visit "customers/#{@customer_2.id}"
      expect(page).to have_content(@customer_2.name)
    end

    it "displays a list of the customer's items and their info" do
      visit "customers/#{@customer_1.id}"
      save_and_open_page
      expect(page).to have_content("Name: #{@item_1.name}")
      expect(page).to have_content("Price: #{@item_1.price}")
      expect(page).to have_content("Supermarket: #{@supermarket_1.name}")

      expect(page).to have_content("Name: #{@item_2.name}")
      expect(page).to have_content("Price: #{@item_2.price}")
      expect(page).to have_content("Supermarket: #{@supermarket_1.name}")

      expect(page).to have_no_content("Name: #{@item_4.name}")
      expect(page).to have_no_content("Price: #{@item_4.price}")
      expect(page).to have_no_content("Supermarket: #{@supermarket_2.name}")
    end
  end
end