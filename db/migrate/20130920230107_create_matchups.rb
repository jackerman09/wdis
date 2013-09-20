class CreateMatchups < ActiveRecord::Migration
  def change
    create_table :matchups do |t|
      t.integer :player_1
      t.integer :player_2
      t.integer :pts_player_1_week_1
      t.integer :pts_player_1_week_2
      t.integer :pts_player_1_week_3
      t.integer :pts_player_1_week_4
      t.integer :pts_player_1_week_5
      t.integer :pts_player_1_week_6
      t.integer :pts_player_1_week_7
      t.integer :pts_player_1_week_8
      t.integer :pts_player_1_week_9
      t.integer :pts_player_1_week_10
      t.integer :pts_player_1_week_11
      t.integer :pts_player_1_week_12
      t.integer :pts_player_1_week_13
      t.integer :pts_player_1_week_14
      t.integer :pts_player_1_week_15
      t.integer :pts_player_1_week_16
      t.integer :pts_player_1_week_17
      t.integer :pts_player_2_week_1
      t.integer :pts_player_2_week_2
      t.integer :pts_player_2_week_3
      t.integer :pts_player_2_week_4
      t.integer :pts_player_2_week_5
      t.integer :pts_player_2_week_6
      t.integer :pts_player_2_week_7
      t.integer :pts_player_2_week_8
      t.integer :pts_player_2_week_9
      t.integer :pts_player_2_week_10
      t.integer :pts_player_2_week_11
      t.integer :pts_player_2_week_12
      t.integer :pts_player_2_week_13
      t.integer :pts_player_2_week_14
      t.integer :pts_player_2_week_15
      t.integer :pts_player_2_week_16
      t.integer :pts_player_2_week_17


      t.timestamps
    end
  end
end
