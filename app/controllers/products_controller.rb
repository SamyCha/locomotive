class ProductController < ApplicationController

before_action :set_product, only: [:show, :edit, :update]
before_action :authenticate_user!, except: [:show]

def index
  @products = current_user.products
end

def new
  @product = current_user.products.build
end

def create
  @product = current_user.products.build(product_params)
  if @product.save
    redirect_to @product, notice:"Votre article a été ajouté avec succés"
  else
    render :new
  end
end

def show
end

def edit
end

def update
  if @product.update(product_params)
    redirect_to @product, notice:"Modification enregistrée"
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

end
