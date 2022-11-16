class PostsController < ApplicationController
    def new
        @post = Post.new 
    end
    def create
      #binding.pry
        @post = Post.new(post_params) #データを新規登録するためのインスタンス生成
        @post.user_id = current_user.id
        @post.save#データをデータベースに保存するためのsaveメソッド実行
        #redirect_to action: 'index' #トップ画面へリダイレクト
        redirect_to root_path
    end
    def edit
      @user.image.cache! unless @user.image.blank?
    end
    def change
      @post = Post.find(params[:id])
    # 編集リンクから飛んできたときのparamsに格納されたidを元に、該当する投稿データを探して、変数に代入する
    end
    
    def update
      @post = Post.find(params[:id])
    # 編集ページの送信ボタンから飛んできたときのparamsに格納されたidを元に、該当する投稿データを探して、変数に代入する
      if @post.update(post_params)
        redirect_to post_path, notice: "アウトプットを編集しました"
      else
        flash.now[:danger] = "編集に失敗しました"
        render 'change'
      end
    end
  private
  def post_params #ストロングパラメーター
    params.require(:post).permit(:body,{image: []},:image_cache,lines_tag_ids:[],genre_tag_ids:[]) 
  end
end  
  
