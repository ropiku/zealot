ActionController::Routing::Routes.draw do |map|
  map.resources :spots

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
