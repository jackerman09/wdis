class TeamsController < ApplicationController

  before_action :admin_user, only: [:show, :index, :new, :create, :edit, :update, :destroy]

  def index
    @teams = Team.paginate(page: params[:page])
    @user = view_context.current_user
  end

  def show
    @team = Team.find(params[:id])
    @user = view_context.current_user
  end

  def new
    @team = Team.new
    @user = view_context.current_user
  end

  def create
    @team = Team.new(team_params)
    @user = view_context.current_user
    if @team.save
      flash[:success] = "Team created."
      redirect_to @team
    else
      render 'new'
    end
  end

  def edit
    @team = Team.find(params[:id])
    @user = view_context.current_user
  end

  def update
    @team = Team.find(params[:id])
    @user = view_context.current_user
    if @team.update_attributes(team_params)
      flash[:success] = "Team updated"
      redirect_to @team
    else
      render 'edit'
    end
  end

  def destroy
    @user = view_context.current_user
    Team.find(params[:id]).destroy
    flash[:success] = "Team destroyed."
    redirect_to teams_url
  end

  private

    def team_params
      params.require(:team).permit!
    end
end