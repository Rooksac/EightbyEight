class GamesController < ApplicationController

  before_action :find_game, only: [:show, :update, :destroy]
  skip_before_action :authorized, only: [:student_games]

  def index
    games = Game.all
    render json: games
  end

  def show
    render json: @game
  end

  def create
  end

  def update
  end

  def destroy
  end

  def student_games
    student = Student.find(params[:id])
    render json: student.games
  end

  private 

  def find_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.permit(:white, :black, :result)
  end

end
