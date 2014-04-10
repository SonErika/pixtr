Pixtr::Application.routes.draw do
  get "/galleries/random" => "random_galleries#show"

  root "homes#show"
  resource :dashboard, only: [:show]
  resources :tags, only: [:show]

  resource :account, only: [:show]
  resources :charges, only: [:create] 

  resource :search, only: [:show]

  resources :users, only: [:show] do
    member do #/users/:id/
      post "/follow" => "following_relationships#create" #users/:id/follow
      delete "/unfollow" => "following_relationships#destroy" #users/:id/unfollow
    end
  end

  resources :galleries do
    member do 
    post "like" => "gallery_likes#create"
    delete "unlike" => "gallery_likes#destroy"
  end
    resources :images, only: [:new, :create]
  end

resources :groups, only: [:index, :new, :create, :show] do 
  member do 
    post "like" => "group_likes#create"
    delete "unlike" => "group_likes#destroy"
  end
  member do
    post "join" => "group_memberships#create"
    delete "leave" => "group_memberships#destroy"
  end 
end

resources :comments, only: [:destroy]

resources :images, except: [:index, :new, :create, ] do   
  member do 
    post "like" => "image_likes#create"
    delete "unlike" => "image_likes#destroy"
  end 
    resources :comments, only: [:create]
  end 


end

