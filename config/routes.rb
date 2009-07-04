ActionController::Routing::Routes.draw do |map|
  map.resources :spots
  map.root :controller => "spots"
  
  map.resource :session
  map.open_id_complete 'session', :controller => "session", :action => "create", :requirements => { :method => :get }
  
  map.connect ':controller/:action/:id'
end
