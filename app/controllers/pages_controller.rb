class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :search, :contact]

  def home
    @products = Product.order("RANDOM()").where(active: true).limit(4)
  end


  def search
    @products = Product.where("name ILIKE ?", "%#{params[:name]}%")
  end



  def contact
  end

end
