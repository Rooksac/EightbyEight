class Lesson < ApplicationRecord
    has_many :student_lessons
    has_many :students, through: :student_lessons
    belongs_to :instructor
    
    def students_scores(clubId)
      students_scores = self.students.where(club_id: clubId).includes(:student_lessons).map do |student|
        {
          id: student.id,
          name: student.student_name, 
          score: student.student_lessons.find_by(lesson: self)&.lesson_grade,
          notes: student.student_lessons.find_by(lesson: self)&.notes
        }
      end
  end
end
