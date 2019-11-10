class ItemsController < ApplicationController
  # require 'aws-sdk'

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
    @item = Item.with_attached_images.find(params[:id])
    session[:item_id] = params[:id]
  end

  private

  def create_params
    params.require(:item).permit(:name, :explanation, :size, :price, :status, :delivery_fee, :delivery_origin, :delivery_type, :schedule, :category_id, :brand_id, :user_id, images:[]).merge(user_id: current_user.id)
  end
end
