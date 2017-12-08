class UsersController < ApplicationController
  before_action :authorized, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    if current_user.id == params[:id].to_i
      @user = User.find(params[:id])
    else
      redirect_to user_path(current_user.id)
    end
  end

  def new
    if session[:email]
      redirect_to current_user
    end
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:email] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def admin
    @reservations = Reservation.all
    @completedrescount = Reservation.all.select{|res|res.completed}
    @currentrescount = Reservation.all.select{|res|res.completed == false}

    @users = User.all
    @items = Item.all
    @rescount = Reservation.all.count
    @currentrescount = Reservation.all.count{|res|res.completed == false}
    @completedrescount = Reservation.all.count{|res|res.completed}
    @mostcheckedout = Item.all.max_by{|x|x.reservations.count}
    @mostexpensiveitem = Item.all.max_by{|x|x.cost_daily}

    # how many total reservations ( breakout current and complete)
    # - list current +
    # - completed reservations
    # biggest spender users
    # most checked out tools
    # total tools, total tools checked out / not
    # location with most reservations
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :location_id)
  end

  def authorized
    if logged_in?
    else
      redirect_to signin_path
    end
  end


end
