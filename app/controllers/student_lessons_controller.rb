class StudentLessonsController < ApplicationController
  def index
  end

  def show
  end

  def create
    #example input: {lesson:{lesson object}, students: [{student object}, {student object} ...]}
    student_lessons = []
    lesson = params[:lesson]
    print(lesson)
    for student in params[:students] do
      completed_lesson = StudentLesson.create!(student_id: student[:id], lesson_id: lesson[:id], lesson_grade: student[:score])
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

  def grade_lesson(student, lesson, score)
    print('score:', score, 'questions:', lesson['number_of_questions'])
    grade = (score.to_f/lesson['number_of_questions'].to_f) * 100
    {lesson_grade: grade, student_id: student['id'], lesson_id: lesson['id'], notes: lesson['notes']}
  end
end
