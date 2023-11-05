class GamesController < ApplicationController

  before_action :find_game, only: [:show, :update, :destroy]

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

  private 

  def find_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.permit(:white, :black, :result)
  end

end
