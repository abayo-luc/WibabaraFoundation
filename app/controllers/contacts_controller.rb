class ContactsController < ApplicationController
  before_action :authenticate_user!, :only => [:index]
  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to root_url
    else
      render :new
    end
  end

protected

  def contact_params
    params.require(:contact).permit(:full_name, :email, :message)
  end
end
