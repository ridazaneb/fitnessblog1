class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_review, only: [:show, :edit, :update, :destroy]

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

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def review_params
    params.require(:review).permit(:body)
  end
end
