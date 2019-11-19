class LikesController < ApplicationController

def index
  @likes = Like.where(user_id: current_user.id)
  redirect_to root_path unless user_signed_in?
end

end
