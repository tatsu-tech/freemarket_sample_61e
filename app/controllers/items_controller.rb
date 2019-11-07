class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(create_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render 'items/new'
    end
  end

  def show
  end

  private

  def create_params
    params.require(:item).permit(:name, :explanation, :size, :price, :status, :delivery_fee, :delivery_origin, :delivery_type, :schedule, :category_id, :brand_id, :user_id, images:[])
  end
end
