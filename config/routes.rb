Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'shorten_urls#index'
  resources :shorten_urls, :only => [:index, :create]
  get "shortened/:id", to:"shorten_urls#update_count" , as: :shortened
end
