# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    if current_user.seller?
      @user = User.find(params[:id])
      @products = @user.products
    else
      redirect_to edit_user_registration_path
    end
  end
end
