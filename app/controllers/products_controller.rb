class ProductsController < ApplicationController

before_action :set_product, only: [:show, :edit, :update]
before_action :authenticate_user!, except: [:show]
before_action :require_same_user, only: [:edit, :update]

def index
  @products = current_user.products
end

def new
  @product = current_user.products.build
end

def create
  @product = current_user.products.build(product_params)
  if @product.save
    if params[:images]
      params[:images].each do |i|
        @product.photos.create(image: i)
      end
    end
    @photos = @product.photos
    redirect_to edit_product_path(@product), notice:"Votre article a été ajouté avec succés"
  else
    render :new
  end
end

def show
  @photos = @product.photos
  @reviews = @product.reviews
  if current_user
      @booked = Reservation.where("product_id = ? AND user_id = ?", @product.id, current_user.id).present?
      @hasReview = @reviews.find_by(user_id: current_user.id)
  end
end

def edit
  @photos = @product.photos
end

def update
  if @product.update(product_params)
    if params[:images]
      params[:images].each do |i|
        @product.photos.create(image: i)
      end
    end
    @photos = @product.photos
    redirect_to edit_product_path(@product), notice:"Modification enregistrée"
  else
    render :edit
  end
end

private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :brand, :category, :color, :size, :state, :price, :address, :active)
  end

  def require_same_user
    if current_user.id != @product.user_id
      flash[:danger] = "Vous n'avez pas le droit de modifier cette page"
      redirect_to root_path
    end
  end
end
