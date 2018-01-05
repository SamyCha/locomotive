# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[show]

  def show
    @meetings = Meeting.all
    @user = User.find(params[:id])
    @products = @user.products
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    if @user.destroy
        redirect_to root_url, notice: "Compte supprimé"
    end
  end
end
