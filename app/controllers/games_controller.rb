class GamesController < ApplicationController

  def show
    @game = Game.find(params[:id])
    @game.deal_cards_to_players
  end

  def new
    @game = Game.new
  end

  def create
    if game = Game.create(game_params)
      redirect_to new_game_user_path(game)
    else
      flash["warning"] = "Game Could Not Be Created"
      redirect_to new_game_path
    end
  end

  private

  def game_params
    params.require(:game).permit(:name)
  end

end