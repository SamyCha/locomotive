# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[show search slide]
  before_action :require_same_user, only: %i[edit update destroy]
  before_action :is_admin, only: %i[all_products]

  def all_products
    @products = Product.all
  end

  def search
    @products = Product.where(active: true)
  end

  # pour le slider mobile
  def slide
   @articles = current_user.reservations.last(10)

   if user_signed_in?
    @address = current_user.address
    @distance = current_user.distance
    @active = Product.all.where(active: true)
    @products = @active.near(@address, @distance).sample(50)
  else
    redirect_to search_path
  end
end

  # liste de tous les articles publiés et non publiés du vendeur
  def index
    if current_user.seller?
      @products = current_user.products
    else
      redirect_to root_path
    end
  end

  def new
    if current_user.seller?
      @product = current_user.products.build
    else
      redirect_to root_path
    end
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      params[:images]&.each do |i|
        @product.photos.create(image: i)
      end
      @photos = @product.photos
      redirect_to products_path, alert: 'Votre article est en attente de publication'
    else
      render :new
    end
  end

  def mini_index
    if params[:search]
      @products = Product.search(params[:search])
    else
      @products = Product.all.order("created_at DESC")
    end
  end

  def show
    @user = @product.user
    @photos = @product.photos
    @reviews = @product.reviews
  end

  def edit
    if current_user.seller?
      @photos = @product.photos
    else
      redirect_to root_path
    end
  end

  def update
    @product.active = false
    if @product.update(product_params)
      params[:images]&.each do |i|
        @product.photos.create(image: i)
      end
      @photos = @product.photos
      redirect_to products_path, alert: 'Modification enregistrée'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, alert: 'Article supprimé'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :category, :address, :status, :active, :youtube_id, :developped_at, :objectives, :youtube_startsecond, :project_url, :sector, :framework, :devolpement_duration, :number_of_developper, :github)
  end

  def require_same_user
    if current_user.id != @product.user_id
      flash[:danger] = "Vous n'avez pas le droit de modifier cette page"
      redirect_to root_path
    end
  end

  def is_admin
    if current_user.admin?
    else
      redirect_to root_path
    end
  end

end
