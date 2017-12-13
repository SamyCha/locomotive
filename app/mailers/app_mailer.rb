class AppMailer < ActionMailer::Base

  def new_reservation(product, reservation)
    @user = User.find(product.user_id)
    @reservation = reservation
    @product = product
    mail(from: 'Les armoires de Paris <contact@les-armoires-de-paris.com>', to: @user.email, subject: "Nouvelle réservation !")
  end

end
