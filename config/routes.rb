Recipes::Application.routes.draw do

  root :to => "recipes#index"
  resources :recipes do
    resources :ingredients
  end
end
