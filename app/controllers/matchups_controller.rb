class MatchupsController < ApplicationController

  def index
    @matchups = Matchup.paginate(page: params[:page])
  end

  def show
    @matchup = Matchup.find(params[:id])
    @player1 = Player.find(@matchup.player_1)
    @player2 = Player.find(@matchup.player_2)
  end

  def new
    @matchup = Matchup.new
  end

  def create
    @matchup = Matchup.new(matchup_params)
    if @matchup.save
      flash[:success] = "Matchup created."
      redirect_to @matchup
    else
      render 'new'
    end
  end

  def edit
    @matchup = Matchup.find(params[:id])
    @player1 = Player.find(@matchup.player_1)
    @player2 = Player.find(@matchup.player_2)
  end

  def update
    @matchup = Matchup.find(params[:id])
    # params[:matchup][:team] = Team.find_by(id: params[:matchup][:team_id])
    if @matchup.update_attributes(matchup_params)
      flash[:success] = "Matchup updated."
      redirect_to @matchup
    else
      render 'edit'
    end
  end

  def destroy
    Matchup.find(params[:id]).destroy
    flash[:success] = "Matchup destroyed."
    redirect_to matchups_url
  end

  private

    def matchup_params
      params.require(:matchup).permit!
    end
end

