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

    it "has a form to add an existing item to the customer" do
      visit "customers/#{@customer_1.id}"

      expect(page).to have_content("Add Items by ID")
      fill_in :item_id, with: "#{@item_4.id}"
      expect(page).to have_selector(:link_or_button, 'Add')
      click_button "Add"
      expect(current_path).to eq("/customers/#{@customer_1.id}")
    end

    it "adds the inputted item to the customer's items and displays it on the show page" do
      visit "customers/#{@customer_1.id}"

      expect(page).to have_no_content("#{@item_4.name}")
      fill_in :item_id, with: "#{@item_4.id}"
      click_button "Add"

      expect(page).to have_content("Name: #{@item_4.name}")
      expect(page).to have_content("Price: #{@item_4.price}")
      expect(page).to have_content("Supermarket: #{@supermarket_2.name}")
    end
  end
end