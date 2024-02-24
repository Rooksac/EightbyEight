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
  end

  def update
  end

  def destroy
  end

  private 

  def find_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.permit(:lesson_name, :number_of_questions, :level)
  end

end
