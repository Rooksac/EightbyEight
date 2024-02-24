class StudentLessonsController < ApplicationController
  def index
  end

  def show
  end

  def create
    #example input: {lesson:{lesson object}, students: [{student object}, {student object} ...], grade: integer}
    student_lessons = []
    lesson = params[:lesson]
    grade = params[:grade]
    for student in params[:students] do
      completed_lesson = Student_Lesson.create!(grade_lesson(student, lesson, grade))
      student_lessons.push(completed_lesson)
    end
    render json: student_lessons
  end

  def update
  end

  def destroy
  end

  private

  def student_lesson_params
    params.permit(:lesson_grade, :notes, :student_id, :lesson_id)
  end
end
