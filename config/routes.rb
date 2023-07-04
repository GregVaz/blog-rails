Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "blog_posts#index"

  # get "/blog_posts", to: "blog_posts#index"
  # get "/blog_posts/new", to: "blog_posts#new"
  # post "/blog_posts", to: "blog_posts#create"
  # get "/blog_posts/:id/edit", to: "blog_posts#edit"
  # put "/blog_posts/:id", to: "blog_posts#update"
  # patch "/blog_posts/:id", to: "blog_posts#update"
  # delete "/blog_posts/:id", to: "blog_posts#destroy"
  resources :blog_posts
end
