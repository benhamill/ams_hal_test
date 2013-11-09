AmsHalTest::Application.routes.draw do
  root 'authors#index'

  resources :authors, except: [:new, :edit]
  resources :posts, except: [:new, :edit]
end
