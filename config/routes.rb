Rails.application.routes.draw do
resources :greports do
  collection { post :import }
end
  #root_to 'greports#index'
end
