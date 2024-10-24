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
    render json: @student, serializer: StudentWithGamesSerializer 
  end

  def update
    @student.update!(student_params)
    render json: @student
  end

  def destroy
    @student.destroy!
    head :no_content
  end

  def club_students_missing_lesson
    club = Club.find(params[:clubId])
    students = club.students_missing_lesson(params[:id])
    render json: students
  end

  def lesson_scores
    student = Student.find(params[:id])
    scores = student.lesson_scores
    render json: scores
  end

  def transfer
    student = Student.find(params[:studentId])
    student.update!(club_id: params[:clubId])
    render json: student 
  end

  private 

  def find_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.permit(:student_name, :grade, :club_id, :station)
  end
end
