class CustomerItemsController < ApplicationController
  def new
    CustomerItem.create!(customer_items_params)
    redirect_to "/customers/#{params[:customer_id]}"
  end

  private
  def customer_items_params
    params.permit(:customer_id, :item_id)
  end
end