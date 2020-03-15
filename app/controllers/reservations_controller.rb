class ReservationsController < ApplicationController
    def index
    @reservation = Reservation.all
  end

  def view_my_reservations
    @my_reservations = Reservation.where(user: current_user)
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @garde = Garde.find(params[:garde_id])
    @reservation.garde = @garde
    if @reservation.save
      flash[:notice] = "Votre réservation a bien été enregistrée"
      redirect_to my_reservations_path
    else
      render 'gardes/show'
    end
  end


  def change_status
    @reservation = Reservation.find(params[:id])
    params[:status] == "accept" ? @reservation.status = 'accepted' : @reservation.status = 'declined'
    @reservation.save
    redirect_to my_gardes_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reservation_quantity, :pick_up_date)
  end
end
