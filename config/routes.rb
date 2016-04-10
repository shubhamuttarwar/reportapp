Rails.application.routes.draw do
  
  root 'welcome#index'
  get 'about' , to: 'welcome#about'
  get 'contact' , to: 'welcome#contact'
  get 'reports' , to: 'greports#index'

resources :greports do
  collection { post :import }
end
end
