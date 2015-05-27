Rails.application.routes.draw do
  resources :retailers, only: [:index, :show]
  
  root 'home#index'
  get 'api', to: redirect('/swagger/dist/index.html')

end
