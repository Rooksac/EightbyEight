Instructor.all.destroy_all
Club.all.destroy_all
Student.all.destroy_all
Game.all.destroy_all
Lesson.all.destroy_all

Instructor.create!(name:"Mr.Dean", password:'12345')

Club.create!(club_name:"Wednesday chess club", school:"TAG", meet_time:Time.parse('14:30'), instructor_id:Instructor.all.sample.id)

Student.create!(student_name:"Zak", grade:8, club_id:Club.all.sample.id)
Student.create!(student_name:"Raymond", grade:8, club_id:Club.all.sample.id)

Game.create!(white:Student.first.id, black:Student.last.id, result:"White")


Lesson.create!(lesson_name: "Mate in 1 A", number_of_questions: 10, level: "Step 1")
Lesson.create!(lesson_name: "Mate in 1 B", number_of_questions: 10, level: "Step 1")