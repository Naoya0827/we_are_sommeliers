class Admin::ReviewsController < ApplicationController

  def show
    @review = Review.find(params[:id])
    @review_comments = ReviewComment.where(review_id: @review.id)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to request.referer
  end

   private
  def review_params
    params.require(:review).permit(:drink_id, :user_id, :image, :rating, :title, :impression)
  end
end
