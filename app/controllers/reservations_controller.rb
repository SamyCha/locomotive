class ReservationsController < ApplicationController
  before_action :authenticate_user!

def create
  @reservation = current_user.reservations.create(reservation_params)
    if @reservation.persisted?
      @payment = Payment.new({ email: User.find(@reservation.user_id).email, token: params[:payment]["token"], reservation_id: @reservation.id, amount: @reservation.price })
              begin
          @payment.process_payment
            if @payment.save
              AppMailer.new_reservation(Product.find(@reservation.product_id), @reservation).deliver_now
                redirect_to @reservation.product, notice: "Votre réservation a été acceptée"
            end
        rescue Exception
          @reservation.destroy
            puts 'Le paiement a échoué'
              redirect_to @reservation.product, notice: "Votre paiement a été refusé"
        end
          else
            redirect_to @reservation.product, notice: "Votre réservation a échoué"
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
    params.require(:reservation).permit(:price, :total, :product_id, :payment)
  end
end
