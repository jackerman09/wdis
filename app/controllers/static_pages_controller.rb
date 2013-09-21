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
end
