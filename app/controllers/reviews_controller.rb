# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = current_user.reviews.new(review_params)
    @review.save
  end

def rating
 @reviews = current_user.reviews
#    @reviewsnotactive = Review.where(active: nil)
 end


  private

  def review_params
    params.require(:review).permit(:comment, :star, :product_id, :user_id, :active)
  end



end
