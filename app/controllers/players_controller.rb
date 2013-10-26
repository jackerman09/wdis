class PlayersController < ApplicationController

before_action :signed_in_user,    only: [:index, :show]
before_action :admin_user,        only: [:new, :create, :edit, :update, :destroy, :addmatchups]

  def index
    @players = Player.paginate(page: params[:page])
    @user = view_context.current_user
  end

  def show
    @player = Player.find(params[:id])
    @user = view_context.current_user
  end

  def new
    @player = Player.new
    @user = view_context.current_user
  end

  def create
    params[:player][:team] = Team.find_by(id: params[:player][:team_id])
    @player = Player.new(player_params)
    @user = view_context.current_user
    if @player.save
      flash[:success] = "Player created."
      redirect_to @player
    else
      render 'new'
    end
  end

  def edit
    @player = Player.find(params[:id])
    @user = view_context.current_user
    if @player.team_id == nil

    else
      @team =   Team.find(@player.team_id)
    end
  end

  def update
    @player = Player.find(params[:id])
    @user = view_context.current_user
    params[:player][:team] = Team.find_by(id: params[:player][:team_id])
    if @player.update_attributes(player_params)
      flash[:success] = "Player updated."
      redirect_to @player
    else
      render 'edit'
    end
  end

  def destroy
    @user = view_context.current_user
    Player.find(params[:id]).destroy
    flash[:success] = "Player destroyed."
    redirect_to players_url
  end

  def addmatchups
    players = Player.all
    player1 = Player.find(params[:player1])
    logger.debug("p1: #{player1.full_name}")
    matchups = []
    players.each do |player2|
      exists = Matchup.find_by(player_1: player1.id, player_2: player2.id) || Matchup.find_by(player_1: player2.id, player_2: player1.id)
      if exists.nil?
        if player1.id != player2.id
          matchup = { player_1: player1.id, player_2: player2.id }
          matchups.push matchup
        end
      end
    end

    Matchup.create(matchups)

    redirect_to matchups_path
  end

  private

    def player_params
      params.require(:player).permit!
    end
end
