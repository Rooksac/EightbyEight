Rails.application.routes.draw do
  get 'lessons/index'
  get 'lessons/show'
  get 'lessons/create'
  get 'lessons/update'
  get 'lessons/destroy'
  get 'student_lessons/index'
  get 'student_lessons/show'
  get 'student_lessons/create'
  get 'student_lessons/update'
  get 'student_lessons/destroy'
  get 'games/index'
  get 'games/show'
  get 'games/create'
  get 'games/update'
  get 'games/destroy'
  get '/clubs', to: "clubs#index"
  get 'clubs/:id', to: "clubs#show"
  get 'clubs/create'
  get 'clubs/update'
  get 'clubs/destroy'
  get '/students', to: "students#index"
  get 'students/create'
  get '/students/:id', to: "students#show"
  get 'students/update'
  get 'students/destroy'
  get 'instructors/create'
  get 'instructors/:id', to: "instructors#show"
  get 'instructors/update'
  get 'instructors/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
