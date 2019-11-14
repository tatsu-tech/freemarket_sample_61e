class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:edit, :update]

  def index
    @items = Item.with_attached_images.order("created_at DESC").limit(10)
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

  def edit
    # 販売手数料の初期値
    @sales_fee = (@item.price.to_i*0.1).round
    # 販売利益の初期値
    @sales_profit = (@item.price.to_i*0.9).round
  end

  def update
    if @item.update(create_params) # updateが成功した場合
      if Rails.env.production?
        params[:delete_images].split(",").each do |id|
          ActiveStorage::Attachment.find(id).delete
        end
      else
        params[:delete_images].split(",").each do |id|
          ActiveStorage::Attachment.find(id).delete
        end
      end
        redirect_to myitem_path(@item)
    else
      redirect_to :edit_item_path
    end
  end

  private

  def create_params
    params.require(:item).permit(:name, :explanation, :size, :price, :status, :delivery_fee, :delivery_origin, :delivery_type, :schedule, :category_id, :process, :brand_id, :user_id, images:[]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
