class UsersController < ApplicationController

  def new
    @game = Game.find(params[:game_id])
    @user = User.new
  end

  def create
    game_id = params[:game_id]
    user = User.new(user_params)
    user.game_id = game_id
    if user.save
      flash["success"] = "Hello, #{user.username}"
      redirect_to game_path(game_id)
    else
      flash["warning"] = "User was not created"
      redirect_to new_game_user_path(game_id)
    end
  end

  def show

  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

end