class PlayersController < ApplicationController
def index
    @players = Player.paginate(page: params[:page])
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def create
    params[:player][:team] = Team.find_by(id: params[:player][:team_id])
    @player = Player.new(player_params)
    if @player.save
      flash[:success] = "Player created."
      redirect_to @player
    else
      render 'new'
    end
  end

  def edit
    @player = Player.find(params[:id])
    if @player.team_id == nil

    else
      @team =   Team.find(@player.team_id)
    end
  end

  def update
    @player = Player.find(params[:id])
    params[:player][:team] = Team.find_by(id: params[:player][:team_id])
    if @player.update_attributes(player_params)
      flash[:success] = "Player updated."
      redirect_to @player
    else
      render 'edit'
    end
  end

  def destroy
    Player.find(params[:id]).destroy
    flash[:success] = "Player destroyed."
    redirect_to players_url
  end

  private

    def player_params
      params.require(:player).permit!
    end
end
