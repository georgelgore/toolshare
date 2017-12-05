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
    startd = params[:reservation][:start_date].to_date.mjd #gives date in total number of days, so we can subtract end date from start date to get total number of days rented
    endd = params[:reservation][:end_date].to_date.mjd
    days_rented = (endd-startd).to_f
    if days_rented < 1
      days_rented = 1
    end
    item_daily_cost = Item.find(params[:reservation][:item_id]).cost_daily
    params[:reservation][:total_cost] = days_rented * item_daily_cost
    @reservation = Reservation.new(reservation_params)
    if @reservation.valid?
      @reservation.item.available = false
      # currently, we have no switch to make reservation item status return to true.
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
