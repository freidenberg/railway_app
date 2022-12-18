class PostsController < ApplicationController
    def new
        @post = Post.new 
    end
    def create
      #binding.pry
        @post = Post.new(post_params) #データを新規登録するためのインスタンス生成
        @post.user_id = current_user.id
       if @post.save#データをデータベースに保存するためのsaveメソッド実行
          #redirect_to action: 'index' #トップ画面へリダイレクト
          redirect_to root_path
          else 
          render 'new'
       end
    end
    def edit
      @user.image.cache! unless @user.image.blank?
    end
  private
  def post_params #ストロングパラメーター
    params.require(:post).permit(:body,{image: []},:image_cache,lines_tag_ids:[],genre_tag_ids:[]) 
  end
end  
  
