Rails.application.routes.draw do
  root "to_do_list#index"
  get 'to_do_list/index'
  get "/TodoList", to:"to_do_list#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
