class ReviewsController < ApplicationController

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new(reservation: Reservation.find(params[:id]))
  end

  def create
    @review = Review.new(review_params)
    if @review.valid?
      # change reservation status to reviewed? = true... but won't allow to do here. maybe before save?
      @review.save
      redirect_to review_path(@review)
    else
      redirect_to review_new_path(@review.reservation.id)
    end
  end

  private

  def review_params
    params.require(:review).permit(:reservation_id, :rating, :content)
  end

end
