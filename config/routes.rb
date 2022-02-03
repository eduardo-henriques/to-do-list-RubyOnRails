Rails.application.routes.draw do
  root "list#index"
  resources :list do
    resources :to_do_list
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
