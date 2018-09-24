Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "users#top"

  resources :users, only: [:show, :edit, :update]
  resources :books

  get "/home/about" => "home#about", as: "about"


  resources :users do
   collection do
   end
  end


 #  member do
 #  	get "showusers"
 #  end
#end

end