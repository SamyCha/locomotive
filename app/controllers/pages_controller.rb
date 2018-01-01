# frozen_string_literal: true
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home search contact]

  def home
    @starsellers = User.where(starseller: true).limit(1)

    @selection = Product.where(active: true).limit(3)
    @products = @selection.sort_by {|obj| obj.created_at }.reverse
  end

  def contact
  end

end
