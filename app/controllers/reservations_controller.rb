class ReservationsController < ApplicationController
  before_action :authenticate_user!

def create
  @reservation = current_user.reservations.create(reservation_params)
  redirect_to @reservation.product
end

def your_articles
  @articles = current_user.reservations
end

def your_reservations
  @products = current_user.products
end


private
  def reservation_params
    params.require(:reservation).permit(:price, :total, :product_id)
  end
end
