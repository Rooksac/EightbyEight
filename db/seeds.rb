Instructor.create!(name:"Mr.Dean", password_digest:'12345')

Club.create!(club_name:"Wednesday chess club", school:"TAG", meet_time:Time.parse('14:30'), instructor_id:Instructor.all.sample.id)

Student.create!(student_name:"Zak", grade:8, club_id:Club.all.sample.id)
Student.create!(student_name:"Raymond", grade:8, club_id:Club.all.sample.id)

Game.create!(white:Student.first.id, black:Student.last.id, result:"White")
