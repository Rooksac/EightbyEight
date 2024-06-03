class StudentLesson < ApplicationRecord
    belongs_to :student
    belongs_to :lesson

    validates :student_id, uniqueness: { scope: :lesson_id, message: "this student has already recieved a grade for this lesson" }

    # notes
    validates :notes, length: {maximum: 500}, allow_blank: true
end
