# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[show]

  def show
    @user = User.find(params[:id])
    @products = @user.products


    @meetings = Meeting.all  # à remplacer par @participations = @user.meetings

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    if @user.destroy
        redirect_to root_url, notice: "Compte supprimé"
    end
  end
end
