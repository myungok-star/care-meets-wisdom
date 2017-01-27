Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    root to: 'welcome#index'

    get '/' => 'welcome#index'
    get '/volunteers/login' => 'volunteer_sessions#new'
    post '/volunteers/login' => 'volunteer_sessions#create', as: 'create_volunteer_session'
    delete '/volunteers/logout' => 'volunteer_sessions#destroy', as: 'destroy_volunteer_sessions'

    get '/care_groups/login' => 'care_group_sessions#new'
    post '/care_groups/login' => 'care_group_sessions#create'
    delete '/care_groups/logout' => 'care_group_sessions#destroy', as: 'destroy_care_group_sessions'

    # These routes will be for signup. The first renders a form in the browse, the second will
    # receive the form and create a user in our database using the data given to us by the user.
    get '/volunteers/signup' => 'volunteers#new'
    post '/volunteers' => 'volunteers#create'

    get '/care_groups/signup' => 'care_groups#new'
    post '/care_groups' => 'care_groups#create'

    # end of signup and login routes

    # volunteer routes

    get '/volunteers/:id', to: 'volunteers#show', as: 'volunteer'
    get '/volunteers/:id/edit', to: 'volunteers#edit', as: 'edit_volunteer'
    patch '/volunteers/:id', to: 'volunteers#update', as: 'update_volunteer'

    # caregroup routes
    get '/care_groups', to: 'care_groups#index', as: 'all_care_groups'
    get '/care_groups/:id', to: 'care_groups#show', as: 'care_group'
    get '/care_groups/:id/edit', to: 'care_groups#edit', as: 'edit_care_group'
    patch '/care_groups/:id', to: 'care_groups#update'

    # senior routes

    get '/care_groups/:care_group_id/seniors/new', to: 'seniors#new', as: 'new_care_group_senior'
    get '/care_groups/:care_group_id/seniors', to: 'care_groups#show_seniors', as: 'all_care_group_seniors'
    post '/care_groups/:care_group_id/seniors', to: 'seniors#create'
    get '/care_groups/:care_group_id/seniors/:id', to: 'seniors#show', as: 'care_group_senior'
    get '/care_groups/:care_group_id/seniors/:id/edit', to: 'seniors#edit', as: 'edit_care_group_senior'
    patch '/care_groups/:care_group_id/seniors/:id', to: 'seniors#update'
    delete '/care_groups/:care_group_id/seniors/:id', to: 'seniors#destroy', as: 'delete_care_group_senior'

    # visit routes

    delete '/seniors/:senior_id/visits/:id', to: 'visits#destroy', as: 'delete_visit'
    post '/seniors/:senior_id/visits', to: 'visits#create', as: 'new_senior_visit'
    get '/seniors/:senior_id/visits/:id', to: 'visits#show', as: 'senior_visit'
    put '/seniors/:senior_id/visits/:id', to: 'visits#approve', as: 'approve_visit'
    patch '/seniors/:senior_id/visits/:id', to: 'visits#complete', as: 'complete_visit'
end
