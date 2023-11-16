class StudentsController < ApplicationController

  before_action :find_student, only: [:show, :update, :destroy]
  def index
    students = Student.all
    render json: students
  end

  def create
    student = Student.create!(student_params)
    render json: student
  end

  def show
    render json: @student
  end

  def update
    @student.update!(student_params)
    render json: @student
  end

  def destroy
    @student.destroy!
    head :no_content
  end

  private 

  def find_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.permit(:student_name, :grade, :club_id)
  end
end
