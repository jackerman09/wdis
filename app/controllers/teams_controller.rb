class TeamsController < ApplicationController

  before_action :admin_user, only: [:show, :index, :new, :create, :edit, :update, :destroy]

  def index
    @teams = Team.paginate(page: params[:page])
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      flash[:success] = "Team created."
      redirect_to @team
    else
      render 'new'
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(team_params)
      flash[:success] = "Team updated"
      redirect_to @team
    else
      render 'edit'
    end
  end

  def destroy
    Team.find(params[:id]).destroy
    flash[:success] = "Team destroyed."
    redirect_to teams_url
  end

  private

    def team_params
      params.require(:team).permit!
    end
end