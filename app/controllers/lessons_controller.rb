class LessonsController < ApplicationController

  before_action :find_lesson, only: [:show, :update, :destroy]

  def index
    lessons = Lesson.all
    render json: lessons
  end

  def show
    render json: @lesson
  end

  def club_lessons
    instructor = Instructor.find(params[:id])
    lessons = instructor.lessons
    render json: lessons
  end

  def create
    lesson = Lesson.create!(lesson_params)
    render json: lesson
  end

  def update
    lesson = @lesson
    lesson.update!(lesson_params)
    render json: lesson
  end

  def update_student_scores
    lesson = Lesson.find(params[:lessonId])
    student_scores = params[:students]

    students_scores.each do |student_data|
      student_lesson = StudentLesson.find_by(student_id: student_data[:id], lesson_id: lesson.id)
      if student_lesson
        student_lesson.update!(lesson_grade: student_data[:score], notes: student_data[:note])
      end
    end
    
    render json: {message: "Student scores updated successfully"}, status: :ok
  end

  def destroy
    @lesson.destroy!
    head :no_content
  end

  def instructor_lessons
    instructor = Instructor.find(params[:id])
    lessons = instructor.lessons
    render json: lessons 
  end

  def lesson_students
    lesson = Lesson.find(params[:id])
    render json: lesson.students_scores(params[:clubId])
  end
  
  private 

  def find_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.permit(:lesson_name, :number_of_questions, :source, :instructor_id, :description)
  end

end
