class UsersController < ApplicationController
  
  def index
  end

  def new
  end

  def destroy
    redirect_to root_path, notice: 'ログアウトしました'
  end
  
end
