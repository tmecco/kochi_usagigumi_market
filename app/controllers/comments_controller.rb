class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    binding.pry
    @seller_of_item = User.find(@comment.item.user_id)
    if @comment.save
      respond_to do |format|
        format.json
      end
    else
      flash[:alert] = "保存できていません"
      redirect_to item_path(params[:id])
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to item_path(@comment.item.id)
    end
  end

  private

  def comment_params
    params.permit(:message,:item_id).merge(user_id: current_user.id)
  end

end