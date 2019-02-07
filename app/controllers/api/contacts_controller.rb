class Api::ContactsController < ApplicationController
  # before_action :authenticate_user

  def index
    @contacts = Contact.all

    search_term = params[:search]
    if search_term
      @contacts = Contact.where("first_name ILIKE ? OR middle_name ILIKE ? OR last_name ILIKE ?", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")
    end

      @contacts = current_user.contacts
      if params[:group] 
        group = Group.find_by(name: params[:group])
        @contacts = current_user.contacts.where()
      end
      render "index.json.jbuilder"
  end

  def show
    @contact = Contact.find_by(id: params["id"])
    render 'show.json.jbuilder'
  end

  def create
    @contact = Contact.new(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      email: params[:email],
      latitude: params[:latitude],
      longitude: params[:longitude],
      phone: params[:phone],
      bio: params[:bio],
      user_id: current_user.id
      )

    if @contact.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @contact = Contact.find_by(id: params[:id])

    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.middle_name = params[:middle_name] || @contact.middle_name
    @contact.last_name = params[:last_name] || @contact.last_name
    @contact.email = params[:email] || @contact.email
    @contact.latitude = params[:latitude] || @contact.latitude
     @contact.longitude = params[:longitude] || @contact.longitude
    @contact.phone = params[:phone] || @contact.phone
     @contact.bio = params[:bio] || @contact.bio

    if @contact.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @contact = Contact.find_by(id: params["id"])
    @contact.destroy
    render json: {message: "#{@contact.first_name} #{@contact.last_name} successfully deleted."}
  end
end
