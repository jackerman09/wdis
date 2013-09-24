class StaticPagesController < ApplicationController

  def home
    @matchup = Matchup.order("RANDOM()").first
    @player1 = Player.find(@matchup.player_1)
    @player2 = Player.find(@matchup.player_2)
  end
  
  def help
  end

  def about
  end

  def contact
  end

  def updatepts
    # @matchup = Matchup.find_by(player_1: params[:matchupid])
    # if params[:player1or2] = 1
    #   @matchup.update_attributes("pts_player_1_week_#{params[:current_week]}".to_sym => params[:newPointValue])
    # else
    #   @matchup.update_attributes(pts_player_2_week_1: params[:newPointValue])
    # end
    @matchup = Matchup.find(params[:matchupid])
    @player1 = Player.find(@matchup.player_1)
    @player2 = Player.find(@matchup.player_2)
    # @matchup.update_attributes(pts_player_1_week_1:)

    new_player_1_pts = @player1.last_name
    data = {new_player_1_pts: new_player_1_pts }
    render :json => data, :status => :ok
    # redirect_to root_url
  end
end
