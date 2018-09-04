Rails.application.routes.draw do
  devise_for :users
  resources :enrollments
  resources :cohorts
  resources :courses
  resources :instructors
  resources :students


  authenticated :user do
    root 'courses#index', as: :authenticated_root
    # resources :enrollments
    # resources :cohorts
    # resources :courses
    # resources :instructors
    # resources :students
  end
  # root 'devise/sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
