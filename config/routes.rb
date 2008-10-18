ActionController::Routing::Routes.draw do |map|
  map.resources :pieces

  map.resources :categories

  map.resources :titles

  map.resources :interprets

  map.home '', :controller => 'root', :action => 'index'
  
  map.resources :users
  map.resource  :session
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login  '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  
  map.connect ':controller/:action/:id'
end