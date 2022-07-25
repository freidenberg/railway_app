class PostsController < ApplicationController
    def new
        @post = Post.new
    end
    def create
        @post = Post.new(post_params)#データを新規登録するためのインスタンス生成
        @post.save #データをデータベースに保存するためのsaveメソッド実行
        #redirect_to action: 'index' #トップ画面へリダイレクト
        redirect_to root_path
    end
  private
    
  def post_params #ストロングパラメータ
    params.require(:post).permit(:body) #パラメーターのキー
  end
end
