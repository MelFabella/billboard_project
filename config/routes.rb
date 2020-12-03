Rails.application.routes.draw do
  root 'billboards#index'

  resources :billboards do
    resources :artists
  end
  # dont embed your routes deep
  resources :billboards do
    resources :songs
  end
end
