NyplData::Application.routes.draw do
  match "/register_callback" => "register#create"
  match "/" => "checkin#show"

  resources :checkin, :only => [:create]
  resources :placemarks, :only => [:index, :show]
end
