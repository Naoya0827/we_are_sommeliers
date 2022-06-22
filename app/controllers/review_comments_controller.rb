class ReviewCommentsController < ApplicationController
  def create
    @review_comment = ReviewComment.new(review_comment_params)
    @review_comment.save
    redirect_to request.referer
  end

  def destroy
    review_comment = ReviewComment.find(params[:id])
    review_comment.destroy
    redirect_to request.referer
  end

  private
  def review_comment_params
    params.require(:review_comment).permit(:comment, :review_id, :user_id)
  end
end
