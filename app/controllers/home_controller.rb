class HomeController < ApplicationController
  def top
    @posts = Post.all.order("id desc")
  end
end
