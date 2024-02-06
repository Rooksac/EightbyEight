class ClubsController < ApplicationController
  
  before_action :find_club, only: [:show, :update, :destroy]

  def index
    clubs = Club.all
    render json: clubs
  end
  
  def show
    students = @club.students
    if students
      render json: { club: @club, students: students }
    else
      render json: { error: 'Students not found for this club' }, status: :not_found
    end
  end

  def show_students
    students = @club.students
    if students
      render json: { students: students }
    else
      render json: { error: 'Students not found for this club' }, status: :not_found
    end
  end

  def create
  end

  def update
  end

  def destroy
  end

  private 

  def find_club
    @club = Club.find(params[:id])
  end

  def club_params
    params.permit(:club_name, :school, :meet_time, :instructor_id)
  end
end
