class Api::ContactsController < ApplicationController
  # before_action :authenticate_user

  def index
    @contacts = Contact.all
    # @contacts = current_user.contacts

    if params[:group]
      group = Group.find_by(name: params[:group])
      @contacts = group.contacts #how do we get current users contacts in a specific group?
    end

    render "index.json.jbuilder"
  end

  def create
    @contact = Contact.new(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      email: params[:email],
      phone: params[:phone],
      bio: params[:bio]
      # user_id: current_user.id
    )

    if @contact.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @contact = Contact.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @contact = Contact.find(params[:id])

    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.middle_name = params[:middle_name] || @contact.middle_name
    @contact.last_name = params[:last_name] || @contact.last_name
    @contact.email = params[:email] || @contact.email
    @contact.phone = params[:phone] || @contact.phone
    @contact.bio = params[:bio] || @contact.bio

    if @contact.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    render json: {message: "Contact successfully destroyed!!"}
  end

end
