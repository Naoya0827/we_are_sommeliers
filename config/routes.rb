Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  patch 'users/withdraw' => 'users#withdraw'
  resource :users, only:[:show, :edit, :update]

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

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
  get 'drinks/:id' => 'drinks#show', as:'drink'
  get 'drinks/edit/:id' => 'drinks#edit', as:'edit_drinks'
  patch 'drinks/:id' => 'drinks#update', as:'update_drinks'
  delete 'review_comments/:id' => 'review_comments#destroy', as:'review_comments'
  resource :review_comments, only:[:create, :destroy]
  resource :reviews, only:[:new, :index, :create]
  get 'reviews/:id' => 'reviews#show', as:'review'





 namespace :admin do
   get 'areas' => 'areas#index'
   get 'areas/edit/:id' => 'areas#edit', as:'edit_areas'
   resource :areas, only:[:create, :update]
   get 'genres' => 'genres#index'
   get 'genres/edit/:id' => 'genres#edit', as:'edit_genres'
   resource :genres, only:[:create, :update, :index]
 end
end
