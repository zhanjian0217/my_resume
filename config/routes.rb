Rails.application.routes.draw do

  get "/@:user_id", to: "users#default_resume"
  get "/@:user_id/:id", to: "resumes#show", as: "user_resume"

  resources :resumes do 
    collection do 
      get :my
    end

    member do 
      patch :pin
    end
  end

  resource :users, only:[:create] do  
    get :sign_up
    get :sign_in
  end
 
  resource :sessions, only: [:create, :destroy]

  namespace :admin do 
    resources :vendors, except:[:show]
  end


  root "resumes#index"
end
