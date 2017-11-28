class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :search, :contact]

  def home
    @products = Product.order("RANDOM()").where(active: true).limit(3)
  end

    def search
      if params[:search].present? && params[:search].strip != ""
         session[:airmoires_search] = params[:search]
      end
        arrResult = Array.new
      if session[:armoires_search] && session[:armoires_search] != ""
         @products_address = Product.where(active: true).near(session[:armoires_search], 5, order:'distance')
      else
         @products_address = Product.where(active: true).all
      end
        @search = @products_address.ransack(params[:q])
        @products = @search.result
        @arrProducts = @products.to_a
      #on peut ici ajouter des conditions supplémentaires

      end


  def contact
  end

end
