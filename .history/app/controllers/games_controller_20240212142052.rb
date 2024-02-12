class GamesController < ApplicationController
  before_action :find_game, only: [:show, :update, :destroy]
  skip_before_action :authenticate_request, if: -> { request.env['HTTP_USER_AGENT'].include?('Postman') }
  skip_before_action :authorized, only: [:student_games,]

  def index
    games = Game.all
    render json: games
  end

  def show
    render json: @game
  end

  def create
    created_games = []
    params[:games].each do |game_params|
      new_game = Game.create!(white: game_params[:white], black: game_params[:black], result: nil)
      created_games.push(new_game)
    end

    render json: created_games
  rescue ActiveRecord::RecordInvalid => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def update
    @game.update!(game_params)
    render json: @game
  rescue ActiveRecord::RecordInvalid => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def destroy
    @game.destroy!
    head :no_content
  end

  def student_games
    student = Student.find(params[:id])
    render json: student.games
  end

  def in_progress
    games = Game.in_progress(params[:id])
    render json: games
  end

  private 

  def find_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:result)
  end
end
