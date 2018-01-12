# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate_user!

# C'est Checkpassword qui ne fonctionne pas car sans cette condition ça crée bien une review
# A faire: Essayer une autre condition à la place que je puisse vérifier..
def form
@review = current_user.reviews.new
end

def create
if check_password
@review = current_user.reviews.new(review_params)
@review.save
redirect_to @review.product
else
render :new, notice: "Le code n'est pas bon"
end
end

private

def review_params
  params.require(:review).permit(:comment, :star, :product_id, :user_id, :password)
end

def set_product
  @product = Product.find(params[:product_id, :reviewcode])
end

def check_password
  return @review.password == @product.reviewcode
end

end
