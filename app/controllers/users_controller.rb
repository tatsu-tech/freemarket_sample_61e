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
    @myitem = Item.find(current_user.id)
    redirect_to root_path unless current_user&.id
  end

  def in_progress
  end

  def completed
  end

  def purchase
  end

  def purchased
  end
 
end
