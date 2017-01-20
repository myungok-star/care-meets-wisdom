Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: 'welcome#index'

  get '/volunteers/login' => 'volunteer_sessions#new'
  post '/volunteers/login' => 'volunteer_sessions#create'
  get '/volunteers/logout' => 'volunteer_sessions#destroy'

  get '/care_groups/login' => 'care_group_sessions#new'
  post '/care_groups/login' => 'care_group_sessions#create'
  get '/care_groups/logout' => 'care_group_sessions#destroy'

# These routes will be for signup. The first renders a form in the browse, the second will
# receive the form and create a user in our database using the data given to us by the user.
  get '/volunteers/signup' => 'volunteers#new'
  post '/volunteers' => 'volunteers#create'

  get '/care_groups/signup' => 'care_groups#new'
  post '/care_groups' => 'care_groups#create'


end
