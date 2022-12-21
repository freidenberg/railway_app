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
      #@user.image.cache! unless @user.image.blank? 
      @post = Post.find(params[:id])
    end

    def update
      @post = Post.find(params[:id])
    # 編集ページの送信ボタンから飛んできたときのparamsに格納されたidを元に、該当する投稿データを探して、変数に代入する
      if @post.update(post_path)
        redirect_to post_path, notice: "投稿を編集しました"
      else
        flash.now[:danger] = "編集に失敗しました"
        render 'edit'
      end
  private
  def post_params #ストロングパラメーター
    params.require(:post).permit(:body,{image: []},:image_cache,lines_tag_ids:[],genre_tag_ids:[]) 
  end
end  
end   
