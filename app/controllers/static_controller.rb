class StaticController < ApplicationController
  def home
    @posts = Post.paginate(:page => params[:page], :per_page => 10)
    @categories = Category.all
  end

  def about
  end
  
  def contact
  end
end
