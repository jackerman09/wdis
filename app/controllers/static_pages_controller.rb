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
    @matchup = Matchup.find(params[:matchupid])
    @player1 = Player.find(@matchup.player_1)
    @player2 = Player.find(@matchup.player_2)
    
    current_week = view_context.current_week

    new_player_1_pts = @matchup.send("pts_player_1_week_#{current_week}")
    new_player_2_pts = @matchup.send("pts_player_2_week_#{current_week}")
    
    if params[:player1or2] == '1'
      if new_player_1_pts.nil?
        new_player_1_pts = 1
      else
        new_player_1_pts += 1
      end
      @matchup.update_attributes(pts_player_1_week_1: new_player_1_pts)
    else
      if new_player_2_pts.nil?
        new_player_2_pts = 1
      else
        new_player_2_pts += 1
      end
      @matchup.update_attributes(pts_player_2_week_1: new_player_2_pts)
    end

    data = {
      new_player_1_pts: new_player_1_pts,
      new_player_2_pts: new_player_2_pts
    }
    render :json => data, :status => :ok
  end
end
