# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home search contact qui devenir_vendeuse concept conditions]
  before_action :is_admin, only: %i[admindashboard publish_product user_to_seller]

  def home
    @starsellers = User.where(starseller: true).limit(1)

    @selection = Product.where(active: true).limit(8)
    @products = @selection.sort_by(&:created_at).reverse
    @highlights = Meeting.where(highlight: true).sample(1)
    @starsellers = User.where(starseller: true).sample(1)


if user_signed_in?
    @address = current_user.address
    @distance = current_user.distance
    @active = Product.all.where(active: true)
    @proximity = @active.near(@address, @distance).sample(8)
end

  end

  def admindashboard
    @meetings = Meeting.all.sort_by(&:start_time)

    @user = current_user
    @users = User.all
    @sellers = User.seller
    @lastuserregistered = User.all.sort_by(&:created_at).last(20)
    @sellerwaitinglist = User.where(choice: true).where(state: "client")
    @starsellers = User.where(starseller: true)

    @products = Product.all
    @onlines = Product.all.where(active: true)
    @myproducts = current_user.products.last(10)
    @notactives = Product.all.where(active: false).where.not(status: 1)

    @reviews = Review.all.sort_by(&:created_at).last(4)
    @reviewsnotactive = Review.where(active: nil)

    @meetings = Meeting.where('start_time > ?', Time.now)

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
 if @user.client?
   @user.seller!
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

def devenir_vendeuse
@meetings = Meeting.where(highlight: true).where('start_time > ?', Time.now)
end

def qui
end

def concept
    @products =  Product.where(active: true).limit(3).sort_by(&:created_at).reverse
end

def conditions
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
