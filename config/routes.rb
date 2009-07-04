ActionController::Routing::Routes.draw do |map|
  map.resources :spots, :collection => {:search => :get}
  map.root :controller => "spots"
  
  map.resources :tags
  
  map.resource :session
  map.open_id_complete 'session', :controller => "sessions", :action => "create", :requirements => { :method => :get }
  
  map.login  '/login',  :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  
  map.connect ':controller/:action/:id'
end
