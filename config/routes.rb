Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => "user/registrations",
    :sessions => 'user/sessions'
  }

  get '/search' => 'search#index'
  get '/search/list' => 'search#list'

  get '/mypage' => 'mypage#my_post'
  get '/mypage/new_news/:users_id' => 'mypage#new_news'
  get '/mypage/bookmark/:users_id' => 'mypage#bookmark'
  get '/mypage/setting/:users_id' => 'mypage#setting'

  resources :posts do
      resources :comments, only: [:create]
    end
  resources :comments, only: [:edit, :update, :destroy]

  resources :posts, except: [:show] do
     post "/bookmark", to: "mypage#bookmark_toggle"
  end



  post '/posts/:id/comment_create' => 'posts#comment_create'
  # get 'mypage/:id/bookmark_create' => 'mypage#bookmark_create'
  # delete 'mypage/:id/bookmark_destroy' => 'mypage#bookmark_destroy'
  get '/' => 'posts#index'

  # api
  namespace :api do
    namespace :v1 do
      resources :posts

      devise_scope :user do
        post "/sign_in", :to => 'sessions#create'
        post "/sign_up", :to => 'registrations#create'
        delete "/sign_out", :to => 'sessions#destroy'
      end
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
