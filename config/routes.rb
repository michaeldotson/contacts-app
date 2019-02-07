Rails.application.routes.draw do
  namespace :api do
    # get "/one_contact_url" => "contacts#one_contact_method"
    # get "/all_contacts_url" => "contacts#all_contacts_method"

    get "contacts" => "contacts#index"
    get "contacts/:id" => "contacts#show"
    post "contacts" => "contacts#create"
    patch "contacts/:id" => "contacts#update"
    delete "contacts/:id" => "contacts#destroy"

    post "/users" => "users#create"
    post "/sessions" => "sessions#create"
  end
  get "/contacts" => "contacts#index"
  get "/contacts/new" => "contacts#new"
  get "/contacts/:id" => "contacts#show"
  get "/contacts/:id/edit" => "contacts#edit"
  post "/contacts/" => "contacts#create"
  patch "/contacts/:id" => "contacts#update"
  delete "/contacts/:id" => "contacts#destroy"

end

