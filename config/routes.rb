# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#                      root GET    /                                                                                        static_pages#root
#                 api_users POST   /api/users(.:format)                                                                     api/users#create {:format=>:json}
#                           GET    /api/users(.:format)                                                                     api/users#check_email {:format=>:json}
#                api_videos GET    /api/videos(.:format)                                                                    api/videos#index {:format=>:json}
#                 api_video GET    /api/videos/:id(.:format)                                                                api/videos#show {:format=>:json}
#                api_genres GET    /api/genres(.:format)                                                                    api/genres#index {:format=>:json}
#                 api_genre GET    /api/genres/:id(.:format)                                                                api/genres#show {:format=>:json}
#                 api_lists GET    /api/lists(.:format)                                                                     api/lists#index {:format=>:json}
#                           POST   /api/lists(.:format)                                                                     api/lists#create {:format=>:json}
#                  api_list DELETE /api/lists/:id(.:format)                                                                 api/lists#destroy {:format=>:json}
#               api_session DELETE /api/session(.:format)                                                                   api/sessions#destroy {:format=>:json}
#                           POST   /api/session(.:format)                                                                   api/sessions#create {:format=>:json}
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 root to: 'static_pages#root'

  namespace :api, defaults: {format: :json} do
    post '/users', to: 'users#create'
    get '/users', to: 'users#check_email'
    resources :videos, only: [:index, :show]
    resources :genres, only: [:index, :show]
    resources :lists, only: [:index, :create, :destroy]
    resource :session, only: [:create, :destroy]
  end
end
