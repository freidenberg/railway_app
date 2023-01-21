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

    def show 
      #@user = User.find(params[:id])
      @post = Post.find(params[:id])
      @comments = @post.comments.includes(:user).all #投稿詳細に関連付けてあるコメントを全取得
      @comment = current_user.comments.new  #投稿詳細画面でコメントの投稿を行うので、formのパラメータ用にCommentオブジェクトを取得
      @comment_reply = @post.comments.build #コメントに対する返信用の変数
    end

    def edit
      #@user.image.cache! unless @user.image.blank? 
      @post = Post.find(params[:id])
    end

    def update
      @post = Post.find_by(params[:id])
      @post.body = params[:body] 
      @post.image = params[:image] 
      @post.update
     # 編集ページの送信ボタンから飛んできたときのparamsに格納されたidを元に、該当する投稿データを探して、変数に代入する
      if @post.body.empty? then 
        redirect_to post_path, notice: "保存できませんでした"
        else
        redirect_to post_path, notice: "投稿を編集しました"
      end
    end 

  private
  def post_params #ストロングパラメーター
    params.require(:post).permit(:body,{image: []},:image_cache,lines_tag_ids:[],genre_tag_ids:[]) 
  end

  def update_params #ストロングパラメーター
    params.require(:post).permit(:body,{image: []},:image_cache,lines_tag_ids:[],genre_tag_ids:[]) 
  end

end   
