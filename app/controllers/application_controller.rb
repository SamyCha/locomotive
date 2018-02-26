# frozen_string_literal: true
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

#Mailboxer
rescue_from ActiveRecord::RecordNotFound do
  flash[:warning] = 'Resource not found.'
  redirect_back_or root_path
end

def redirect_back_or(path)
  redirect_to request.referer || path
end

  protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: %i[pseudo address distance choice])
  devise_parameter_sanitizer.permit(:account_update, keys: %i[pseudo avatar phone address distance description starseller email password password_confirmation state])
  end
end
