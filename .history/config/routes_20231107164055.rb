Rails.application.routes.draw do
  get 'lessons', to: "lessons#index"
  get 'lessons/:id', to: "lessons#show"
  get 'games', to: "games#index"
  get 'games/:id', to: "games#show"
  get 'clubs', to: "clubs#index"
  get 'clubs/:id', to: "clubs#show"
  get 'clubs/:id/students', to: 'clubs#show_students'
  get 'students', to: "students#index"
  get 'students/:id', to: "students#show"
  get 'instructors/:id', to: "instructors#show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
