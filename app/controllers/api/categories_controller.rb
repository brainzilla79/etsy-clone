class Api::CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render :index
  end

  def show
    @products = Category.includes(products: :seller).find(params[:id]).products
    render 'api/products/index'
  end

  private 

  def category_params
    params.require(:category).permit(:title)
  end 
end
