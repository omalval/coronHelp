class GardesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show], raise: false
  before_action :set_garde, only: [:show, :edit, :update, :destroy]


  def index
    @gardes = Garde.geocoded


    @markers = @gardes.map do |garde|
      {
        lat: garde.latitude,
        lng: garde.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { garde: garde })

      }
    end
  end


  def show
    @garde = Garde.find(params[:id])
    @reservation = Reservation.new
  end

  def view_my_gardes
    @my_gardes = Garde.where(user: current_user)

    my_received_gardes = []

    @my_gardes.each do |garde|
      my_received_gardes << garde.reservations
    end

    @my_received_gardes = my_received_gardes.flatten
  end

  def view_my_garde
    @my_gardes = Garde.where(user: current_user)
    @my_garde = @my_gardes.find(params[:id])
  end

  def new
    @garde = Garde.new
  end

  def create
    @garde = Garde.new(garde_params)
    @garde.user = current_user
    if @garde.save
      redirect_to garde_path(@garde)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @garde.update(garde_params)
    redirect_to garde_path(@garde)
  end

  def destroy
    @garde.destroy
    redirect_to my_gardes_path
  end

  private

  def set_garde
    @garde = Garde.find(params[:id])
  end

  def garde_params
    params.require(:garde).permit(:name, :description, :contact, :category, :address, :quantity_max, :start_availability_date, :end_availability_date)
  end


end
