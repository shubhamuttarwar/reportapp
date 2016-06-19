Rails.application.routes.draw do

  root 'welcome#index'
  get 'about' , to: 'welcome#about'
  get 'contact' , to: 'welcome#contact'
  get 'reports' , to: 'greports#index'

resources :greports do
  collection { post :import }
end

  get 'signup' , to: 'users#new'
 #post 'users', to: 'users#create'
 resources :users, except: [:new]

  get 'login' , to: 'sessions#new'
  post 'login' , to:'sessions#create'
  delete 'logout' , to: 'sessions#destroy'
  post 'signup', to: 'sessions#create'

 resources :greports do
  get 'buildlist', on: :new
end
resources :greports do
  collection {delete :destroyall }
  get 'destroyall', on: :new
end

match 'greports/destroyall' => 'greports#destroyall', via: [:get, :post]
resources :greports

end
