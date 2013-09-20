# == Schema Information
#
# Table name: matchups
#
#  id                   :integer          not null, primary key
#  player_1             :integer
#  player_2             :integer
#  pts_player_1_week_1  :integer
#  pts_player_1_week_2  :integer
#  pts_player_1_week_3  :integer
#  pts_player_1_week_4  :integer
#  pts_player_1_week_5  :integer
#  pts_player_1_week_6  :integer
#  pts_player_1_week_7  :integer
#  pts_player_1_week_8  :integer
#  pts_player_1_week_9  :integer
#  pts_player_1_week_10 :integer
#  pts_player_1_week_11 :integer
#  pts_player_1_week_12 :integer
#  pts_player_1_week_13 :integer
#  pts_player_1_week_14 :integer
#  pts_player_1_week_15 :integer
#  pts_player_1_week_16 :integer
#  pts_player_1_week_17 :integer
#  pts_player_2_week_1  :integer
#  pts_player_2_week_2  :integer
#  pts_player_2_week_3  :integer
#  pts_player_2_week_4  :integer
#  pts_player_2_week_5  :integer
#  pts_player_2_week_6  :integer
#  pts_player_2_week_7  :integer
#  pts_player_2_week_8  :integer
#  pts_player_2_week_9  :integer
#  pts_player_2_week_10 :integer
#  pts_player_2_week_11 :integer
#  pts_player_2_week_12 :integer
#  pts_player_2_week_13 :integer
#  pts_player_2_week_14 :integer
#  pts_player_2_week_15 :integer
#  pts_player_2_week_16 :integer
#  pts_player_2_week_17 :integer
#  created_at           :datetime
#  updated_at           :datetime
#

class Matchup < ActiveRecord::Base
end
