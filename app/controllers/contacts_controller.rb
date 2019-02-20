class ContactsController < ApplicationController
  
  def index
    @contacts = Contact.all
  end

  def new
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def create
    @product = Product.new(
    first_name: params[:first_name],
    middle_name: params[:middle_name],
    last_name: params[:last_name],
    email: params[:email],
    phone: params[:phone],
    bio: params[:bio],
    group: params[:group]
    )

    @contact.save
    redirect_to "/contacts/#{@contact.id}" 
  end

  def update
    @contact = Contact.find(params[:id])
    @group = Group.find(params[:id])

    @contact.first_name = params[:first_name]
    @contact.middle_name = params[:middle_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.phone = params[:phone] 
    @contact.bio = params[:bio]
    @group.name = params[:name]
    # @contact.id = @contact.id

    @contact.save
    redirect_to "/contacts/#{@contact.id}"
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to "/contacts"
  end
end
