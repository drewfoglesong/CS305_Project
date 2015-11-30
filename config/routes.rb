Rails.application.routes.draw do
  
  get 'testscore/scores'

  get 'dashboard/add_remove_students'

 get 'students/new'

  root  'sessions#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'about' => 'static_pages#about'
  get 'home' => 'dashboard#home'
  get 'help' => 'static_pages#help'

  get 'add_remove_student' => 'students#list'
  get 'add_student' => 'students#new'
  post 'add_remove_student' => 'students#list'
  get 'chapter_four' => 'games#chapter_four'
  get 'student_select' => 'students#student_select'
  get 'add_remove_teacher' => 'teachers#list'
  post 'add_remove_teacher' => 'teachers#list'
  get 'add_teacher' => 'teachers#new'


  resources :teachers
  resources :students

  

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
