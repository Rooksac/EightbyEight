class StudentsController < ApplicationController

  before_action :find_student, only: [:show, :update, :destroy]
  def index
    students = Student.all
    render json: students
  end

  def create

  end

  def show
    render json: @student
  end

  def update
  end

  def destroy
  end

  private 

  def find_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.permit(:student_name, :grade, :club_id)
  end
end
