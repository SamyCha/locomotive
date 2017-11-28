class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = 'Message envoyé'
    else
      flash.now[:error] = 'Message non envoyé'
      render :new
    end
  end
end
