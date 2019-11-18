class MyitemsController < ApplicationController
  before_action :set_myitem_id, only: [:index, :show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def edit
  end

  def update
    render users_mypage_user_path(current_user.id)
  end

  def destroy
    @myitem.destroy
    redirect_to users_mypage_user_path(current_user.id), alert: '出品した商品を削除しました'
  end

  helper_method :process_update
  private

  def set_myitem_id
    @myitem = Item.find(params[:id])
    redirect_to root_path unless current_user&.id
  end
  
end
