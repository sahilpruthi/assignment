Rails.application.routes.draw do
	root to: 'home#index'
  devise_for :users,
			:controllers  => {
          :registrations => 'users/registrations',
          :sessions => 'users/sessions',
          :passwords => 'users/passwords',
           }
  resources :secret_code, only: :index do
  	collection do 
  		post :generate_secret_codes
  		get :generate_codes
  	end

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
