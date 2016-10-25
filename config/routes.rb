Rails.application.routes.draw do
  
  root 'welcome#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }, :skip => [:sessions, :passwords, :registrations]
  as :user do
    post 'users/sign_in' => 'devise/sessions#create', :as => :user_session
    delete 'users/sign_out' => 'devise/sessions#destroy', :as => :destroy_user_session
  end

end
