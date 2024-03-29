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
      @post = Post.find(params[:id])
      @comments = @post.comments.includes(:user).all #投稿詳細に関連付けてあるコメントを全取得
      @comment = current_user.comments.new
      @comment_reply = @post.comments.build #コメントに対する返信用の変数
    end


    def edit 
      @post = Post.find(params[:id])
      unless @post.user == current_user
        redirect_to  root_path
      end
    end

    def update         
      @post = Post.find(params[:id])
      if @post.user != current_user
        redirect_to  root_path
       else
        @post.update!(post_params) 
        # 編集ページの送信ボタンから飛んできたときのparamsに格納されたidを元に、該当する投稿データを探して、変数に代入する
         redirect_to root_path, notice: "投稿を編集しました"
      end    
    end 

    def destroy
      @post = Post.find(params[:id])
      if @post.user != current_user
        redirect_to  root_path
       else
       @post.destroy 
       redirect_to root_path, notice: "削除しました"
      end
    end  

  private
  def post_params #ストロングパラメーター
    params.require(:post).permit(:body,{image: []},:image_cache,lines_tag_ids:[]) 
  end

end


