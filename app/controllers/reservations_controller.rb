class ReservationsController < ApplicationController
  before_action :authorized

  def index
    @reservations = Reservation.all
  end

  def show
    if current_user.id == Reservation.find(params[:id]).user_id
      @reservation = Reservation.find(params[:id])
    else
      redirect_to new_reservation_path
    end
  end

  def new
    @current_user = current_user
    if params[:id]
      @reservation = Reservation.new(item: Item.find(params[:id].to_i))

    else
      @reservation = Reservation.new
    end
  end

  def create
    params[:reservation][:total_cost] = calc_total_cost(params)
    @reservation = Reservation.new(reservation_params)
    if @reservation.valid?
      @reservation.item.change_availability
      # currently, we have no switch to make reservation item status return to true.
      @reservation.save
      redirect_to reservation_path(@reservation)
    else
      redirect_to new_reservation_path
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(reservation_params)
    if @reservation.valid?
      redirect_to reservation_path(@reservation)
    else
      render :edit
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @user = @reservation.user
    @reservation.destroy
    redirect_to @user
  end


  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :item_id, :start_date, :end_date, :total_cost)
  end

  def calc_total_cost(params)
    startd = params[:reservation][:start_date].to_date.mjd #gives date in total number of days, so we can subtract end date from start date to get total number of days rented
    endd = params[:reservation][:end_date].to_date.mjd
    days_rented = (endd-startd).to_f
    if days_rented < 1
      days_rented = 1
    end
    item_daily_cost = Item.find(params[:reservation][:item_id]).cost_daily
    days_rented * item_daily_cost
  end

  def authorized
    if logged_in?
    else
      redirect_to signin_path
    end
  end




end
