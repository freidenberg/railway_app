class HomeController < ApplicationController
  def top
  end
  def index
    @posts = Output.order(created_at: :desc)
  # 投稿順(最新順)にデータを表示させるようにする
  end
  
  def new
    @post = Output.new
  # 空のOutputインスタンスを生成する
  end
  
  def create
    @post = Output.new(output_params)
  # newページで入力した内容が格納された状態のインスタンスが飛んでくる
    @post.user_id = current_user.id
  # user_idカラムにcurrent_userのidを代入する
    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  private
    def output_params
      params.require(:output).permit(:title, :body)
    end
end
