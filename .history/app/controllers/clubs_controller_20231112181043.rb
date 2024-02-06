class ClubsController < ApplicationController
  
  before_action :find_club, only: [:show, :update, :destroy, :create]

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
