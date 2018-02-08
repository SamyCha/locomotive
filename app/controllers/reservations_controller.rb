# frozen_string_literal: true

class ReservationsController < ApplicationController
  before_action :authenticate_user!

#Ajout d'un produit dans la wishlist de l'acheteur
  def create
    @product = Product.find(params[:product_id])
    @booked = Reservation.where('product_id = ? AND user_id = ?', @product.id, current_user.id).present?

    @reservation = current_user.reservations.new(reservation_params)
    if @booked
      redirect_to @reservation.product, alert: 'Cet article est déjà dans votre liste'
    else
      @reservation.save
      redirect_to your_articles_path, alert: 'Cet article a été ajouté à votre liste'
    end
  end
# contenu de la wishlist
  def your_articles
    @articles = current_user.reservations
  end
# liste de sproduits en vente par le seller
  def your_reservations
    @products = current_user.products
  end

  private

  def reservation_params
    params.require(:reservation).permit(:price, :total, :product_id)
  end
end
