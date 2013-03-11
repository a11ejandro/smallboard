class CategoriesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :admin_user, only: [:create, :destroy]
  
  
  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @posts = @category.posts.paginate(page: params[:page])
    @post = current_user.posts.build(params[:post]) if signed_in?
  end
  
  def new
    @category = Category.new
  end
  
  #For functionality expanding in future
  def create
    @category = Category.new(params[:user])
    if @category.save
      flash[:success] = "Category created!"
      redirect_to admin_path
    end
  end
  
  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = "Category destroyed."
    redirect_to admin_path
  end
end
