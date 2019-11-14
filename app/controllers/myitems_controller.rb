class MyitemsController < ApplicationController
  before_action :check_user_id, only: [:index, :show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def edit
  end

  def update
    render mypage_user_path(current_user.id)
  end

  def destroy
    @myitem.destroy
    redirect_to mypage_user_path, alert: '出品した商品を削除しました'
  end

  helper_method :process_update
  private

  def check_user_id
    @myitem = Item.find(params[:id])
    redirect_to root_path unless current_user&.id
  end
  
end
