Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'programming/index'
  get 'programming', to: 'programming#index'
  get 'programming/add' 
  post 'programming/add', to: 'programming#create'
  get 'programming/edit/:id', to: 'programming#edit'
  post 'programming/edit/:id', to: 'programming#update'
  patch 'programming/edit/:id', to: 'programming#update'
  get 'programming/delete/:id', to: 'programming#delete'
  get 'programming/:id', to: 'programming#show'

  

end