class ReviewsController < ApplicationController
  def show
    @review = Review.find(params[:id])
    @user = current_user
  end

  def edit
  end

  def update
  end

  def create
    @review = Review.new(review_params)
    @review.save
    redirect_to review_path(@review.id)
  end

  def destroy
  end

  private
  def review_params
    params.require(:review).permit(:drink_id, :user_id, :image, :rating, :title, :impression)
  end
end
