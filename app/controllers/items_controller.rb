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
      redirect_to myitem_path(@item), notice: '商品の出品に成功しました'
    else
      render 'items/new', notice: '出品に失敗しました。必要事項を入力してください。'
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
