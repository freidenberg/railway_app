class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  # フォローするとき
  def create
    current_user.follow(params[:user_id])
    #following = current_user.relationships.build(follower_id: params[:user_id])
    #following.save
    redirect_to request.referrer || root_path 
  end
  # フォロー外すとき
  def destroy
    current_user.unfollow(params[:user_id])
    #following = current_user.relationships.build(follower_id: params[:user_id])
    #following.destroy
    redirect_to request.referrer || root_path 
  end
  # フォロー一覧
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end
  # フォロワー一覧
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
end


