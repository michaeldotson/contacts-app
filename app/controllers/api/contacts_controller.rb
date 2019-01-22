class Api::ContactsController < ApplicationController

  def index
    @contacts = Contact.all
    render 'index.json.jbuilder'
  end

  def show
    @contact = Contact.find_by(id: params["id"])
    render 'show.json.jbuilder'
  end

  def create
    @contact = Contact.new(
      first_name: params["first_name"],
      last_name: params["last_name"],
      email: params["email"],
      phone: params["phone"]
      )
    @contact.save
    render 'show.json.jbuilder'
  end

  def update
    @contact = Contact.find_by(id: params["id"])
    @contact.first_name = params["first_name"] || @contact.first_name
    @contact.last_name = params["last_name"] || @contact.last_name
    @contact.email = params["email"] || @contact.email
    @contact.phone = params["phone"] || @contact.phone

    @contact.save
    render 'show.json.jbuilder'
  end

  def destroy
    @contact = Contact.find_by(id: params["id"])
    @contact.destroy

    render json: {message: "#{@contact.first_name} #{@contact.last_name} successfully deleted."}
  end
end