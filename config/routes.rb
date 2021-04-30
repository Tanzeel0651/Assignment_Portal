Rails.application.routes.draw do
  resources :corpus
  devise_for :users , controllers: { sessions: "sessions" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  as :user do
    get 'login', to: 'sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
  end
  get 'exam_portal', to: 'users#exam'
  get 'report_portal', to: 'users#report'
  post 'report_portal', to: 'users#report'
  get 'checker', to: 'users#checker' 
  get 'result', to: 'users#result'
  #post 'exam_portal', to: 'users/exam'
  post '/', to: 'users#index'
  root 'users#index'
end
