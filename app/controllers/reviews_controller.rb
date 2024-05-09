class ReviewsController < ApplicationController
 /* before_action :authenticate_user!, only: [:new, :create] */
 /* before_action :set_review, only: [:edit, :update, :destroy] */

  def new
    @review = Review.new
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to root_path, notice: "Review was successfully created."
    else
      render :new
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:body)
  end
end
