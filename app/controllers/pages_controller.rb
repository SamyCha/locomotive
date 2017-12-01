class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :search, :contact]

  def home
    @products = Product.order("RANDOM()").where(active: true).limit(3)
  end

  def contact
  end

end
