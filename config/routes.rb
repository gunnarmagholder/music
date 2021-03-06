ActionController::Routing::Routes.draw do |map|
  map.resources :messages

  map.resources :pieces

  map.resources :categories

  map.resources :titles

  map.resources :interprets

  map.home '', :controller => 'root', :action => 'index'
  
  map.open_id_complete 'session', :controller => "sessions", :action => "create", :requirements => { :method => :get }
  
  map.resources :users
  map.resource  :session
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login  '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  
  map.connect ':controller/:action/:id'
end