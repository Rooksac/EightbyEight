Rails.application.routes.draw do
  get 'lessons', to: "lessons#index"
  get 'lessons/:id', to: "lessons#show"
  post 'lessons', to: "lessons#create"
  get 'lesson_students/:clubId/:id', to: 'lessons#lesson_students'
  get 'addstudentlessons/:clubId/:id', to: 'students#club_students_missing_lesson'
  get 'instructor_lessons/:id', to: "lessons#instructor_lessons"
  get 'games', to: "games#index"
  get 'games/:id', to: "games#show"
  get 'games/student_games/:id', to: "games#student_games"
  post 'games', to: "games#create"
  get 'games/in_progress/:id', to: "games#in_progress"
  get 'games/completed/:id', to: "games#completed"
  delete 'games/:id', to: "games#destroy"
  patch 'games/:id', to: "games#update"
  get 'clubs', to: "clubs#index"
  get 'clubs/:id', to: "clubs#show"
  post 'clubs', to: "clubs#create"
  patch 'clubs/:id', to: "clubs#update"
  delete 'clubs/:id', to: "clubs#destroy"
  get 'students', to: "students#index"
  post 'students', to: "students#create"
  patch 'students/:id', to: "students#update"
  delete 'students/:id', to: "students#destroy"
  get 'students/:id', to: "students#show"
  get 'instructors/:id', to: "instructors#show"
  post 'instructors', to: "instructors#create"
  delete 'instructors/:id', to: "instructors#destroy"
  post 'login', to: "instructors#login"
  delete 'logout', to: "instructors#logout"
  get 'me', to: "instructors#me"
  post 'student_lessons', to: "student_lessons#create"
  get 'club_lessons/:id', to: "lessons#club_lessons"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
