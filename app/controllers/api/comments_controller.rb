class Api::CommentsController < ApplicationController
  def index
    @comments = Product.find(params[:product_id]).comments.includes(:user)
    render :index
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save!
      render :show
    else
      render json: @comment.errors.full_messages, status: 422
    end
  end

  def update
    @comment = current_user.comments.find(params[:id])
    if @comment.update_attributes(comment_params)
      render :show
    else
      render json: @comment.errors.full_messages, status: 422
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy!
    render :show
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :product_id)
  end
end
