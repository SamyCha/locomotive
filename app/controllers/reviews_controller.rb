class ReviewsController < ApplicationController

 def create
   @review = current_user.reviews.create(review_params)
   redirect_to @review.product
 end

 def destroy
   @review = Review.find(params[:id])
   product = @review.product
   @review.destroy
   redirect_to product
 end

 private
 def review_params
   params.require(:review).permit(:comment, :star, :product_id)
 end

end
