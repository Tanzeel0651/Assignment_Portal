Rails.application.routes.draw do
  resources :corpus
  resources :students, only:[:new, :create]
  get 'login', to: 'homes#new_student'
  post 'login', to: 'homes#login_student'
  get 'login_', to: 'homes#new_teacher'
  post 'login_', to: 'homes#login_teacher'
  get 'welcome', to: 'homes#welcome'
  delete 'welcome', to: 'homes#welcome'
  get 'authorized', to: 'homes#page_requires_login'
  get 'show', to: 'students#show'
  post 'teacher', to: 'teachers#show'
  get 'exit', to: 'homes#exit'
  get 'checker', to: 'students#checker' 
  # get 'show', to: 'homes#logout'
  post 'logout', to: 'homes#logout_student'
  get 'logout', to: 'homes#logout_student'
  delete 'logout', to: 'homes#logout_student'
  delete 'logout_', to: 'teachers#logout'
  get 'new_assign', to: 'corpus#new'
  post 'create', to: 'corpus#create'
  #get 'home/new'
  #get 'home/create'
  #get 'home/login'
  #get 'home/welcome'
  #get 'students/new'
  #get 'students/create'
  root 'homes#welcome'
  resources :teachers
  resources :students
  resources :homes
  resources :corpus
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
