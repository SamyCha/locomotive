# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home search contact qui]
  before_action :is_admin, only: %i[admindashboard publish_product user_to_seller]

  def home
    @starsellers = User.where(starseller: true).limit(1)

    @selection = Product.where(active: true).limit(3)
    @products = @selection.sort_by(&:created_at).reverse
    @highlights = Meeting.where(highlight: true).sample(1)
    @starsellers = User.where(starseller: true).sample(1)
  end

  def admindashboard
    @meetings = Meeting.all.sort_by(&:start_time)

    @user = current_user
    @users = User.all
    @sellers = User.seller
    @lastuserregistered = User.all.sort_by(&:created_at).last(20)
    @sellerwaitinglist = User.where(choice: true)
    @starsellers = User.where(starseller: true)

    @products = Product.all
    @onlines = Product.all.where(active: true)
    @myproducts = current_user.products.last(10)
    @notactives = Product.all.where(active: false).where.not(status: 1)

    @reviews = Review.all.sort_by(&:created_at).last(4)
    @reviewsnotactive = Review.where(active: nil)


    @markers = Gmaps4rails.build_markers(@products) do |product, marker|
      marker.lat product.latitude
      marker.lng product.longitude
    end



  end


#Administrator fast Product publication
def publish_product
  @product = Product.find(params[:id])
  @product.active = !@product.active
  redirect_to :admindashboard if @product.save
end

#Administrator change User from buyer to seller
# A corriger#####
###########

def user_to_seller
  @user = User.find(params[:id])
  if @user.state = 0
    @user.state = 1
    @user.save
  end
  redirect_to :admindashboard if @user.save
end

##########

#Administrator fast Review publication
def publish_review
  @review = Review.find(params[:id])
  @review.active = !@review.active
  redirect_to :admindashboard if @review.save
end



def qui
end

def contact
end

private

def is_admin
  if current_user.admin?
  else
    redirect_to root_path
  end
end


def product_params
  params.require(:product).permit(:name, :description, :brand, :category, :color, :size, :state, :price, :address, :status, :active)
end



end
