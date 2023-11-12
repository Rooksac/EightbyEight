class StudentLessonsController < ApplicationController
  def index
  end

  def show
  end

  def create
    student_lesson = StudentLesson.create!(student_lesson_params)
    render json: student_lesson
  end

  def update
  end

  def destroy
  end

  private

  def student_lesson_params
    params.permit(:completed, :lesson_grade, :notes, :student_id, :lesson_id)
  end
end
