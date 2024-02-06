class ClubsController < ApplicationController
  
  before_action :find_club, only: [:show, :update, :destroy]
  before_action :students, only: [:show]

  def index
    clubs = Club.all
    render json: clubs
  end
  
  def show
    render json: {club: @club, students: @students}
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

  def students
    @club = Club.find(params[:id])

    if @club
      @students = @club.students
      render json: @students
    else
      render json: { error: 'Club not found' }, status: :not_found
    end
  end

  def club_params
    params.permit(:club_name, :school, :meet_time, :instructor_id)
  end
end
