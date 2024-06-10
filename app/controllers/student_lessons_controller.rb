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
      completed_lesson = StudentLesson.create!(
        student_id: student[:id], 
        lesson_id: lesson[:id], 
        lesson_grade: student[:score],
        notes: student[:note]
        )
      student_lessons.push(completed_lesson)
    end
    render json: student_lessons
  end

  def update
    student_lesson = StudentLesson.find(params[:id])
    student_lesson.update!(student_lesson_params)
    render json: student_lesson
  end

  def destroy
  end

  def update_student_scores
    lesson = Lesson.find(params[:lessonId])
    student_scores = params[:students]

    student_scores.each do |student_data|
      student_lesson = StudentLesson.find_by(student_id: student_data[:id], lesson_id: lesson.id)
      if student_lesson
        student_lesson.update!(lesson_grade: student_data[:score], notes: student_data[:note])
      end
    end
    
    render json: {message: "Student scores updated successfully"}, status: :ok
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
