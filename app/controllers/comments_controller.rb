class CommentsController < ApplicationController

  def create
    if user_signed_in? && comment_params[:comment_content].present? && comment_params[:post_id].present? 
      @comment = Comment.new(comment_params)
      @comment.user_id = current_user.id
      respond_to do |format|
        if @comment.save
          format.js {}
        end
      end
    else
      redirect_to root_path
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:comment_content, :post_id)
    end
end
