Tallerucb::Application.routes.draw do
  
  get "comments_solutions/new/:solution_id" => "comments_solutions#new"
  resources :comments_solutions
  
  
  get "practices/solve" => "practices#solve"
  resources :practices

  get "exercises/solve/:id" => "exercises#solve"
  resources :exercises

  get "solutions/report" => "solutions#report"
  get "solutions/report/:practice_number" => "solutions#report"
  get "solutions/report2"
  get "solutions/report2/:user_id" => "solutions#report2"
  get "solutions/report2/:user_id/:practice_number" => "solutions#report2"

  post "solutions/save"
  get "solutions/solve/:excercise_id" => "solutions#solve"
  resources :solutions

  devise_for :users
  resources :users

  root :to => 'practices#solve'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
