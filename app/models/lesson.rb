class Lesson < ApplicationRecord
    has_many :student_lessons
    has_many :students, through: :student_lessons
    belongs_to :instructor
    
    #change level to source
    #add description column
    #add instructor_id and associate
end
