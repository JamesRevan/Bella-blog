Rails.application.routes.draw do

  root to: 'blog/posts#index'

  namespace :author do
    resources :posts
  end

  scope module: 'blog' do
    get 'about' => 'pages#about', as: :about
    get 'contact' => 'pages#contact', as: :contact
    get 'posts' => 'posts#index'
    get 'posts/:id' => 'posts#show'
  end

end
