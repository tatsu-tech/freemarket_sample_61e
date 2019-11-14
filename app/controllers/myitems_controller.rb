class MyitemsController < ApplicationController
  before_action :check_user_id, only: [:index, :show, :destroy]

  def index
  end

  def show
  end

  def destroy
    @myitem.destroy
    redirect_to mypage_user_path, notice: '出品した商品を削除しました'
  end

  private

  def check_user_id
    @myitem = Item.find(params[:id])
    redirect_to root_path unless current_user&.id
  end
  
end
