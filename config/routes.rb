NyplData::Application.routes.draw do
  match "/register_callback" => "register#create"
  resources :checkin, :only => [:create]
  resources :placemarks, :only => [:index, :show]
end
