class StudentLesson < ApplicationRecord
    belongs_to :student
    belongs_to :lesson

    def grade_lesson(student, lesson, score)
        grade = (score/lesson.number_of_questions) * 100
        {lesson_grade: grade, student_id: student.id, lesson_id: lesson.id, notes: lesson.notes}
    end
end
