class Supermarket < ApplicationRecord
  has_many :items
  has_many :customers, through: :items

  def customer_names
    customers.distinct.pluck(:name)
  end
end