NyplData::Application.routes.draw do
  resources :checkin, :only => [:create]
  resources :placemarks, :only => [:index, :show]
end
