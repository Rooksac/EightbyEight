class ClubsController < ApplicationController
  
  before_action :find_club, only: [:show, :update, :destroy]
  # skip_before_action :authorized, only: [:index]

  def index
    clubs = Club.all
    render json: clubs
  end
  
  def show
    render json: @club
  end

  def create
    club = Club.create!(club_params)
    render json: club
  end

  def update
    @club.update!(club_params)
    render json: @club
  end

  def destroy
    @club.destroy!
    head :no_content
  end

  def club_names
    clubs = Instructor.find(params[:instructorId]).clubs
    render json: clubs, each_serializer: ClubNamesSerializer
  end

  private 

  def find_club
    @club = Club.find(params[:id])
  end

  def club_params
    params.permit(:club_name, :school, :meet_time, :instructor_id)
  end
end
