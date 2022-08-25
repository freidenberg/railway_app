class LikesController < ApplicationController
    def create
        p params 
        @post_like = Like.new(user_id: current_user.id, post_id: params[:post_id])
        @post_like.save
        redirect_to post_path(params[:post_id])
      
    end
    def destroy
        p params 
        @post_like = Like.find_by(user_id: current_user.id, post: params[:post_id])
        @post_like.destroy
        redirect_to post_path(params[:post_id])      
    end
end
