class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    byebug
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new

  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.valid?
      @reservation.save
      redirect_to reservation_path(@reservation.id)
    else
      redirect_to :new
    end
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
