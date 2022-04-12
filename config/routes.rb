Rails.application.routes.draw do
  resources :resumes

  get "users/sign_up", to: "users#new"

  # get "/resumes", to: "resumes#index"
  # get "/resumes/new", to: "resumes#new", as:"new_resume"
  # post "/resumes", to:"resumes#create"
  # get "/resumes/:id", to:"resumes#show", as:"resume"
  # delete "/resumes/:id", to:"resumes#destroy"
  # get "resumes/:id/edit", to:"resumes#edit", as:"edit_resume"
  # patch "resumes/:id", to:"resumes#update"
  # put "resumes/:id", to:"resumes#update"

  root "resumes#index"
end
