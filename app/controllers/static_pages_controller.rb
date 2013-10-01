class StaticPagesController < ApplicationController

  def home
    @matchup = getRandomMatchup
    if @matchup.nil?
      flash[:error] = "No matchups in database"
    else
      @player1 = Player.find(@matchup.player_1)
      @player2 = Player.find(@matchup.player_2)
      @user = view_context.current_user
    end
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
    
    @user = view_context.current_user
    
    current_week = view_context.current_week

    new_player_1_pts = @matchup.send("pts_player_1_week_#{current_week}")
    new_player_2_pts = @matchup.send("pts_player_2_week_#{current_week}")

    this_week_player_1_pts = @player1.send("pts_week_#{current_week}")
    this_week_player_2_pts = @player2.send("pts_week_#{current_week}")
    
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

    if cookies[:num_credits].nil?
      cookies.permanent[:num_credits] = 1
    else
      current_credits = cookies[:num_credits].to_f
      current_credits += 1
      cookies[:num_credits] = current_credits
    end

    if @user.nil?
      # flash[:error] = "No current user"
    else
      if @user.num_credits.nil?
        @user.num_credits = 1
      else
        current_credits = @user.num_credits
        current_credits += 1
        @user.num_credits = current_credits
        @user.save
        error_messages_returned = @user.errors.full_messages.to_sentence
        if error_messages_returned = "Password is too short (minimum is 6 characters)"
          @user.save(validate: false)
        end
        user_credits = current_credits
      end
    end

    data = {
      new_player_1_pts: new_player_1_pts,
      new_player_2_pts: new_player_2_pts,
      user_credits: user_credits
    }

    render :json => data, :status => :ok
  end

  def findMatchup
    if params[:matchup][:player_1].nil? || params[:matchup][:player_2].nil?
      redirect_to root_path
    else
      if cookies[:num_credits].nil? || cookies[:num_credits].to_f < 3
        flash[:error] = "You need to vote 3 times for every search. Vote more."
        redirect_to root_path
      else
        @player1 = Player.find(params[:matchup][:player_1])
        @player2 = Player.find(params[:matchup][:player_2])
        @matchup = Matchup.find_by(player_1: @player1.id, player_2: @player2.id)
        if @matchup.nil?
          @matchup = Matchup.find_by(player_1: @player2.id, player_2: @player1.id)
        end
        if @matchup.nil?
          flash[:error] = "Matchup does not exist."
          redirect_to root_path
        else
          current_credits = cookies[:num_credits].to_f
          current_credits -= 3
          cookies[:num_credits] = current_credits
          redirect_to @matchup
        end
      end
    end
  end

  private
    def getRandomMatchup
      Matchup.order("RANDOM()").first
    end
end
