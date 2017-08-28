Rails.application.routes.draw do
  get 'orgs/index'

  root 'application#index'

  resources:users

  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#delete'

  get 'groups' => 'orgs#index'
  post 'groups' => 'orgs#create'
  get 'groups/:id' => 'orgs#show'
  delete 'groups/:id/delete' => 'orgs#delete'

  post 'groups/members/:id/add' => 'followers#create'
  delete 'groups/members/:id/remove' => 'followers#delete'


end
