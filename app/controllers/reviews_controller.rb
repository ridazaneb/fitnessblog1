class ReviewsController < ApplicationController
  # GET /reviews/new
  def new
    @review = Review.new
  end

  # POST /reviews
  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to root_path, notice: "Review was successfully created."
    else
      render :new
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def review_params
    params.require(:review).permit(:body)
  end
end

