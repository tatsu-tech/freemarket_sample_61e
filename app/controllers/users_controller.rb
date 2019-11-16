class UsersController < ApplicationController
  
  def index
  end

  def new
  end

  def mypage
  end

  def identification
  end

  def logout
  end

  def listing
    @myitems = Item.where(process: ["selling","sellingstop"]).where(user_id: current_user.id)
    redirect_to root_path unless user_signed_in?
  end

  def in_progress
    @myitems = Item.where(process: "selltradeing").where(user_id: current_user.id)
    redirect_to root_path unless user_signed_in?
  end

  def completed
    @myitems = Item.where(process: "sellcomp").where(user_id: current_user.id)
    redirect_to root_path unless user_signed_in?
  end

  def purchase
  end

  def purchased
  end
 
end
