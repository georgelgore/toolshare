class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    # byebug
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new(reservation_params)
  end

  def create
    # update with validation
    @reservation = Reservation.create(reservation_params)
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
      # what method goes here?
  end


  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :item_id, :start_date, :end_date, :total_cost)

  end
end
