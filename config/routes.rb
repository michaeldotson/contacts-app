Rails.application.routes.draw do
  namespace :api do
    # get "/one_contact_url" => "contacts#one_contact_method"
    # get "/all_contacts_url" => "contacts#all_contacts_method"

    get "contacts" => "contacts#index"
    get "contacts/:id" => "contacts#show"
    post "contacts" => "contacts#create"
    patch "contacts/:id" => "contacts#update"
    delete "contacts/:id" => "contacts#destroy"
  end
end

