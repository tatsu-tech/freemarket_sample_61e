class MyitemsController < ApplicationController
  before_action :check_user_id, only: [:index, :show, :edit, :update, :destroy]
  def index
  end

  def show
    @myitem = Item.find(params[:id])
  end

  def edit
    @myitem = Item.find(params[:id])

  end

  def destroy
    @myitem = Item.find(params[:id])
    @myitem.destroy
    redirect_to mypage_user_path, notice: '出品した商品を削除しました'
  end

  private

  def check_user_id
    myitem = Item.find(params[:id])
    redirect_to root_path unless current_user&.id
  end

  
end
