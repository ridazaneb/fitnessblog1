class HomepageController < ApplicationController
  def index
    @reviews = Review.all
  end
end
