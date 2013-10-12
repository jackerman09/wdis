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
      @matchup.update_attributes("pts_player_1_week_#{current_week}".to_sym => new_player_1_pts)
    else
      if new_player_2_pts.nil?
        new_player_2_pts = 1
      else
        new_player_2_pts += 1
      end
      @matchup.update_attributes("pts_player_2_week_#{current_week}".to_sym => new_player_2_pts)
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
        current_credits = 1
      else
        current_credits = @user.num_credits
        current_credits += 1
      end
      @user.num_credits = current_credits
      @user.save
      error_messages_returned = @user.errors.full_messages.to_sentence
      if error_messages_returned = "Password is too short (minimum is 6 characters)"
        @user.save(validate: false)
      end
      user_credits = current_credits
    end

    @matchup = getRandomMatchup
    if @matchup.nil?
      flash[:error] = "No matchups in database"
    else
      @player1 = Player.find(@matchup.player_1)
      @player2 = Player.find(@matchup.player_2)
    end

    data = {
      new_player_1_pts: new_player_1_pts,
      new_player_2_pts: new_player_2_pts,
      user_credits: user_credits,
      matchup: @matchup,
      player1: @player1,
      player1OpponentTeamName: Team.find(@player1.team.send("opp_week_#{current_week}")).name,
      ptsplayer1: @matchup.send("pts_player_1_week_#{current_week}"),
      player2: @player2,
      player2OpponentTeamName: Team.find(@player2.team.send("opp_week_#{current_week}")).name,
      ptsplayer2: @matchup.send("pts_player_2_week_#{current_week}"),
      current_week: current_week
    }

    

    render :json => data, :status => :ok
  end

  def userNumCredits
    @user = view_context.current_user
    if @user.nil?
      return 0
    end
    current_week = view_context.current_week

    if @user.nil?
      flash[:error] = "Not logged in"
      redirect_to root_path
    else
      if @user.num_credits.nil?
        current_credits = 0
        @user.num_credits = current_credits
        @user.save
        error_messages_returned = @user.errors.full_messages.to_sentence
        if error_messages_returned = "Password is too short (minimum is 6 characters)"
          @user.save(validate: false)
        end
      else
        current_credits = @user.num_credits
      end
      user_credits = current_credits.to_f
    end
  end

  def getUserNumCredits
    @user = view_context.current_user
    current_week = view_context.current_week

    if @user.nil?
      flash[:error] = "Not logged in"
      redirect_to root_path
    else
      if @user.num_credits.nil?
        current_credits = 0
        @user.num_credits = current_credits
        @user.save
        error_messages_returned = @user.errors.full_messages.to_sentence
        if error_messages_returned = "Password is too short (minimum is 6 characters)"
          @user.save(validate: false)
        end
      else
        current_credits = @user.num_credits
      end
      user_credits = current_credits
    end

    user_credits = @user.num_credits
    data = { user_credits: user_credits }
    render :json => data, :status => :ok
  end

  def findMatchup
    @user = view_context.current_user
    current_week = view_context.current_week
    
    if params[:matchup][:player_1].nil? || params[:matchup][:player_2].nil?
      redirect_to root_path
    else
      if (cookies[:num_credits].nil? || cookies[:num_credits].to_f < 3) && userNumCredits < 3
        flash[:error] = "You need to vote 3 times for every search. Vote more."
        redirect_to root_path
      else
        @player1 = Player.find(params[:matchup][:player_1])
        @player2 = Player.find(params[:matchup][:player_2])
        
        # find the matchup by player ID
        @matchup = Matchup.find_by(player_1: @player1.id, player_2: @player2.id)
        
        # find the matchup by player ID with the ID's in the reversed spot
        if @matchup.nil?
          @matchup = Matchup.find_by(player_1: @player2.id, player_2: @player1.id)
        end
        
        if @matchup.nil?
          flash[:error] = "Matchup does not exist."
          redirect_to root_path
        else
          if @user.nil?
            current_credits = cookies[:num_credits].to_f
            current_credits -= 3
            if current_credits < 0
              current_credits = 0
            end
            cookies[:num_credits] = current_credits            
          else
            current_credits = @user.num_credits
            current_credits -=3
            if current_credits < 0
              current_credits = 0
            end
            @user.num_credits = current_credits
            @user.save
            error_messages_returned = @user.errors.full_messages.to_sentence
            if error_messages_returned = "Password is too short (minimum is 6 characters)"
              @user.save(validate: false)
            end
          end
          redirect_to @matchup
        end
      end
    end
  end

  private
    def getRandomMatchup
      current_week = view_context.current_week

      m = Matchup.order("RANDOM()").first
      
      p1 = Player.find(m.player_1)
      t1 = p1.team
      o1 = Team.find(t1.send("opp_week_#{current_week}")).name

      p2 = Player.find(m.player_2)
      t2 = p2.team
      o2 = Team.find(t2.send("opp_week_#{current_week}")).name

      while o1 == "Bye Week" || o2 == "Bye Week"
        m = Matchup.order("RANDOM()").first

        p1 = Player.find(m.player_1)
        t1 = Team.find(p1.team_id)
        o1 = Team.find(t1.send("opp_week_#{current_week}")).name

        p2 = Player.find(m.player_2)
        t2 = Team.find(p2.team_id)
        o2 = Team.find(t2.send("opp_week_#{current_week}")).name
      end 

      return m
    end
end
