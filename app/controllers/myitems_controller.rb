class MyitemsController < ApplicationController
  before_action :set_myitem_id, only: [:show, :destroy]

  def show
  end

  def destroy
    @myitem.destroy
    redirect_to users_mypage_user_path(current_user.id), notice: '出品した商品を削除しました'
  end

  private

  def set_myitem_id
    @myitem = Item.find(params[:id])
    redirect_to root_path unless current_user&.id
  end

end
