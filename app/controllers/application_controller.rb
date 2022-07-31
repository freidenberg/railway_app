class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
   
   def after_sign_in_path_for(resource)
      home_top_path
   end 
   
   protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    end
    protect_from_forgery with: :exception

# 共通で使われるヘルパー
include ApplicationHelper
# ユーザーセッションの管理やプロフィール画像のURL取得
include HomeHelper
# 投稿画像のURL取得
include PostsHelper
end


