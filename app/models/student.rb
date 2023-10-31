class Student < ApplicationRecord
    belongs_to :club
    has_many :student_lessons
    has_many :lessons, through: :student_lessons
end
