class MatchupsController < ApplicationController

  before_action :admin_user, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @matchups = Matchup.paginate(page: params[:page])
    @user = view_context.current_user
    current_week = view_context.current_week

    total_votes = 0
    Matchup.all.each do |m|
      total_votes += m.send("pts_player_1_week_#{current_week}")
      total_votes += m.send("pts_player_2_week_#{current_week}")
    end
    @this_weeks_votes = total_votes
  end

  def show
    @matchup = Matchup.find(params[:id])
    @player1 = Player.find(@matchup.player_1)
    @player2 = Player.find(@matchup.player_2)
    @user = view_context.current_user
  end

  def new
    @matchup = Matchup.new
    @user = view_context.current_user
  end

  def create
    @matchup = Matchup.new(matchup_params)
    @user = view_context.current_user
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
    @user = view_context.current_user
  end

  def update
    @matchup = Matchup.find(params[:id])
    @user = view_context.current_user
    # params[:matchup][:team] = Team.find_by(id: params[:matchup][:team_id])
    if @matchup.update_attributes(matchup_params)
      flash[:success] = "Matchup updated."
      redirect_to @matchup
    else
      render 'edit'
    end
  end

  def destroy
    @user = view_context.current_user
    Matchup.find(params[:id]).destroy
    flash[:success] = "Matchup destroyed."
    redirect_to matchups_url
  end

  private

    def matchup_params
      params.require(:matchup).permit!
    end
end

