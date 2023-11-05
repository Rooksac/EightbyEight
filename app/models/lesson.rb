class Lesson < ApplicationRecord
    has_many :student_lessons
    has_many :students, through: :student_lessons
    
end
