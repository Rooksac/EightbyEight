class Club < ApplicationRecord
    belongs_to :instructor
    has_many :students

    def top_3
    top_3_students = students.sort_by do |student|
      [-student.total_wins, -student.win_rate]
    end.take(3)
  
    top_3_students_with_wins = top_3_students.map do |student|
      {
        id: student.id,
        student: student.student_name,
        wins: student.total_wins,
        win_rate: student.win_rate,
      }
    end
  
    top_3_students_with_wins
  end

  def students_missing_lesson(lesson_id)
    completed_lesson_ids = Lesson.find(lesson_id).students.pluck(:id)
    self.students.where.not(id: completed_lesson_ids)
  end
end
