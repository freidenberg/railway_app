class PostsController < ApplicationController
    def new
        @post = Post.new
    end
    def create
      #binding.pry
        @post = Post.new(post_params)#データを新規登録するためのインスタンス生成
        @post.user_id = current_user.id
        @post.save#データをデータベースに保存するためのsaveメソッド実行
        #redirect_to action: 'index' #トップ画面へリダイレクト
        redirect_to root_path
    end
    def edit
      @user.image.cache! unless @user.image.blank?
    end
  private
  def post_params #ストロングパラメータ
    params.require(:post).permit(:body,:image,:image_cache) #パラメーターのキー
  end
end
