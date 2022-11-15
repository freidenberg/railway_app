class HomeController < ApplicationController
  def top
    @posts = Post.all.order("id desc")
    #@user = User.find(params[:id])
    #@posts = current_user.posts.all.order("id desc")
    if params[:lines_tag_ids]
      # lines_tag_idsの中でチェックをしたものだけ取得して変数に格納
      lines_tags = params[:lines_tag_ids].select { |key, value| value == "1" }
      # 空でなければ条件の中に入る ⇨ 空でないということはチェックをしたものがあるということ。
      unless lines_tags.blank?
        @posts = []
        params[:lines_tag_ids].each do |key, value|
        if value == "1"
            lines_tag_posts = LinesTag.find_by(name: key).posts
            @posts = @posts.empty? ? lines_tag_posts : @posts & lines_tag_posts
          end
        end
      end
    end
    if  params[:genre_tag_ids]
      # genre_tag_idsの中でチェックをしたものだけ取得して変数に格納
      lines_tags = params[:genre_tag_ids].select { |key, value| value == "1" }
      # 空でなければ条件の中に入る ⇨ 空でないということはチェックをしたものがあるということ。
      unless lines_tags.blank?
        @posts = []
        params[:genre_tag_ids].each do |key, value| 
          if value == "1"
            genre_tag_posts = GenreTag.find_by(name: key).posts
            @posts = @posts.empty? ? genre_tag_posts : @posts & genre_tag_posts
          end
        end
      end
    end
  end 
  def show 
    #@user = User.find(params[:id])
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user).all #投稿詳細に関連付けてあるコメントを全取得
    @comment = current_user.comments.new  #投稿詳細画面でコメントの投稿を行うので、formのパラメータ用にCommentオブジェクトを取得
    @comment_reply = @post.comments.build #コメントに対する返信用の変数
  end

  def mypage 
    @bookmarks = Bookmark.where(user_id: current_user.id)   
    @user = User.find(params[:id])
    @post = Post.find(params[:id])
    #@username = current_user.name   
    logger.debug("デバッグ")          
  end   

def user
  @user = User.find(params[:id])
end  



  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_back(fallback_location: root_path)  #コメント送信後は、一つ前のページへリダイレクトさせる。
    else
      redirect_back(fallback_location: root_path)  #同上
    end
  end

  private
  def post_params
    params.require(:post).permit(:post_content)
  end
end  
