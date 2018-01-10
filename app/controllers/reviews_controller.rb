# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
#   if check_password
    @review = current_user.reviews.new(review_params)
    @review.save
    redirect_to @review.product
#  else
#   render :create, notice: "Le code n'est pas bon"
# end
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
