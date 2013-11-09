AmsHalTest::Application.routes.draw do
  constraints format: 'application/hal+json' do
    get '/', to: 'authors#index'

    resources :authors, except: [:new, :edit]
    resources :posts, except: [:new, :edit]
  end

  root 'application#four_oh_four'
end
