Rails.application.routes.draw do
  resources :mining_types
  get 'welcome/index'
  # mesma coisa de "get 'welcome/index', to: 'welcome#index'" mas pela rota ter a mesma formação de 'controler#action' podemos ocultar o 'to'
  resources :coins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # a rota padrão será apontada para o controller 'welcome' e action 'index'
  root to: 'welcome#index'
end
