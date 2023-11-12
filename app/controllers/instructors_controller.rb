class InstructorsController < ApplicationController

  before_action :find_instructor, only: [:show, :update, :destroy]

  

  def create
    instructor = Instructor.create!(instructor_params)
    render json: instructor
  end

  def show
    render json: @instructor, include: ['clubs', 'clubs.students']
  end

  def update
  end

  def destroy
  end

  private 

  def find_instructor
    @instructor = Instructor.find(params[:id])
  end

  def instructor_params
    params.permit(:name, :password)
  end
end
