 class PostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :new, :edit, :update, :destroy, :admin]
  before_filter :admin_user, only: [:edit, :new, :update, :destroy, :admin]
  
  def new
    @post = Post.new
  end
  
  def create
    @categories = Category.all
    @category = Category.find(params[:category_id])
    @post = current_user.posts.build(params[:post]) if signed_in?
    @post.category = @category
    if @post.save
      flash[:success] = "Post created!"
      redirect_to category_path(@category)
    else
      render 'categories/show'
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
