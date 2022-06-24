Rails.application.routes.draw do

  get 'relationships/followings'
  get 'relationships/followers'
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  get 'users/edit/:id' => 'users#edit', as:'users_edit'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  patch 'users/withdraw' => 'users#withdraw'
  get 'users/:id' => 'users#show', as:'users'
  post 'relationships/:id' => 'relationships#create', as:'follow'
  delete 'relationships/:id' => 'relationships#delete', as:'unfollow'
  resource :relationships, only: [:create, :destroy]


  get 'my_page' => 'users#my_page', as:'my_page'
  patch 'users/:id' => 'users#update', as:'update_users'


  root to:'homes#top'


  resource :creators, only:[:new, :create, :update]
  get 'creators/search' => 'creators#search', as:'creators_search'
  get 'creators' => 'creators#index'
  get 'creators/:id' => 'creators#show', as:'creator'
  get 'creators/edit/:id' => 'creators#edit', as:'edit_creators'
  patch 'creators/:id' => 'creators#update', as:'update_creators'

  resource :drinks, only:[:new, :create]
  get 'drinks/search' => 'drinks#search', as:'drinks_search'
  get 'drinks' => 'drinks#index'
  get 'drinks/edit/:id' => 'drinks#edit', as:'edit_drinks'
  patch 'drinks/:id' => 'drinks#update', as:'update_drinks'
  get 'drinks/:id' => 'drinks#show', as:'drink'
  resources :drinks, only:[:show] do
   post 'favorite_drinks/:id' => 'favorite_drinks#create', as:'favorite_drinks_create'
   delete 'favorite_drinks/:id' => 'favorite_drinks#destroy', as:'favorite_drinks_destroy'
  end
  get 'favorite_drinks' => 'favorite_drinks#index', as:'favorite_drinks_index'

  delete 'review_comments/:id' => 'review_comments#destroy', as:'review_comments'
  post 'review_comments/:id' => 'review_comments#create', as:'review_comments_create'
  resource :review_comments, only:[:create, :destroy]
  resource :reviews, only:[:new, :index, :create]
  get 'reviews/:id' => 'reviews#show', as:'review'
  resources :reviews, only:[:show] do
   post 'favorites/:id' => 'favorites#create', as:'favorites_create'
   delete 'favorites/:id' => 'favorites#destroy', as:'favorites_destroy'
  end
  get 'favorites' => 'favorites#index', as:'favorites_index'





 namespace :admin do
   get 'areas' => 'areas#index'
   get 'areas/edit/:id' => 'areas#edit', as:'edit_areas'
   resource :areas, only:[:create, :update]
   get 'genres' => 'genres#index'
   get 'genres/edit/:id' => 'genres#edit', as:'edit_genres'
   resource :genres, only:[:create, :update, :index]
   get 'users' => 'users#index', as:'users'
   get 'users/:id' => 'users#show', as:'user'
 end
end
