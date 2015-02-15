class FollowsController < ApplicationController
   before_action :authenticate_user!

  def create
    their_user_id = params[:user_id]
    me = @current_user
    them = User.find(their_user_id)

    me.follow(them)

    redirect_to root_path
  end

  def destroy
    their_user_id = params[:user_id]
    me = @current_user
    them = User.find(their_user_id)

    me.stop_following(them)

    redirect_to root_path

  end
end
