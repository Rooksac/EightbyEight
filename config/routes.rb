Rails.application.routes.draw do
  get 'lessons', to: "lessons#index"
  get 'lessons/:id', to: "lessons#show"
  get 'games', to: "games#index"
  get 'games/:id', to: "games#show"
  get 'clubs', to: "clubs#index"
  get 'clubs/:id', to: "clubs#show"
  post 'clubs', to: "clubs#create"
  patch 'clubs', to: "clubs#update"
  delete 'clubs', to: "clubs#destroy"
  get 'students', to: "students#index"
  post 'students', to: "students#create"
  patch 'students', to: "students#update"
  delete 'students', to: "students#destroy"
  get 'students/:id', to: "students#show"
  get 'instructors/:id', to: "instructors#show"
  post 'instructors', to: "instructors#create"
  delete 'instructors', to: "instructors#destroy"
  post 'login', to: "instructors#login"
  get 'logout', to: "instructors#logout"
  get 'me', to: "instructors#me"
  post 'student_lessons', to: "student_lessons#create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
