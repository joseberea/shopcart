Rails.application.routes.draw do
  get 'welcome/index'

  resources :products, :carts, :recipes
  resources :recipe_products
  resources :cart_products
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  
  post '/carts/:id/close', to: 'carts#close', as: 'close_cart'
  post '/carts/:id/open', to: 'carts#open', as: 'open_cart'
  get  '/carts/:id/add_products', to: 'carts#add_products', as: 'cart_add_products'  
  post  '/carts/:id/add_products_submit', to: 'carts#add_products_submit', as: 'cart_add_products_submit'  
  
  post '/cart_products/:id/close', to: 'cart_products#close', as: 'close_cart_product'
  post '/cart_products/:id/open', to: 'cart_products#open', as: 'open_cart_product'

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
