class Club < ApplicationRecord
    belongs_to :instructor
    has_many :students, dependent: :destroy

    def top_3_games
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

  def top_3_lessons
    top_3_students = students.sort_by do |student|
      [ -student.lessons.count, -student.average_grade]
    end.take(3)

    top_3_students_with_grades = top_3_students.map do |student|
      {
        id: student.id,
        student: student.student_name,
        number_of_lessons: student.lessons.size,
        average_grade: student.average_grade
      }
    end
    top_3_students_with_grades

  end

  def students_missing_lesson(lesson_id)
    completed_lesson_ids = Lesson.find(lesson_id).students.pluck(:id)
    self.students.where.not(id: completed_lesson_ids)
  end

  def formatted_time
    self.meet_time.strftime("%l:%M %p")
  end
  
end
