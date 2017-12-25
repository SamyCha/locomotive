# frozen_string_literal: true

class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.find(params[:product_id])
    @booked = Reservation.where('product_id = ? AND user_id = ?', @product.id, current_user.id).present?

    @reservation = current_user.reservations.new(reservation_params)
    if @booked
      redirect_to @reservation.product, notice: 'Cet article est déjà dans votre liste'
    else
      @reservation.save
      redirect_to your_articles_path, notice: 'Cet article a été ajouté à votre liste'
    end
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

# def create
#    @reservation = current_user.reservations.create(reservation_params)
#      redirect_to @reservation.product, notice: "Cet article a été ajouté à votre liste"
# end
