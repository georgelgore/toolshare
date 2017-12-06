class ReviewsController < ApplicationController

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new(reservation_id: params[:id])
  end

  def create
    @review = Review.new(review_params)
  end

end
