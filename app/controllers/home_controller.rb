class HomeController < ApplicationController
  def top
    @posts = Post.all.order("id desc")
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
  
  

  def mypage 
    @bookmarks = Bookmark.where(user_id: current_user.id)   
    @user = User.find(params[:id])
    @post = Post.find(params[:id])  
    logger.debug("デバッグ")          
  end   

def user
  @user = User.find(params[:id])
  @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end
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

