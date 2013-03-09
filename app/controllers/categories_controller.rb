class CategoriesController < ApplicationController
  before_filter :signed_in_user, only: [:new, :edit, :update, :destroy]
  
  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @posts = @category.posts.paginate(page: params[:page])
  end
  
  def new
    @category = Category.new
  end
end
