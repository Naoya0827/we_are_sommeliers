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
  resource :creators, only:[:new, :index, :edit, :create, :update]
  get 'creators/:id' => 'creators#show', as:'creator'


 namespace :admin do
   get 'areas' => 'areas#index'
   get 'areas/edit/:id' => 'areas#edit', as:'edit_areas'
   resource :areas, only:[:create, :update]
   get 'genres' => 'genres#index'
   get 'genres/edit/:id' => 'genres#edit', as:'edit_genres'
   resource :genres, only:[:create, :update, :index]
 end
end
