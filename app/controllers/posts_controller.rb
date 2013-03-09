 class PostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :edit, :update, :destroy]
  before_filter :admin_user, only: [:edit, :update, :destroy, :admin]
  
  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      render 'static/home'
    end
  end

  def index
  end
  
  def show
    
  end

  def destroy
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def admin
    
  end
  
end
