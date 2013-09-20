class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :location
      t.integer :opp_week_1
      t.integer :opp_week_2
      t.integer :opp_week_3
      t.integer :opp_week_4
      t.integer :opp_week_5
      t.integer :opp_week_6
      t.integer :opp_week_7
      t.integer :opp_week_8
      t.integer :opp_week_9
      t.integer :opp_week_10
      t.integer :opp_week_11
      t.integer :opp_week_12
      t.integer :opp_week_13
      t.integer :opp_week_14
      t.integer :opp_week_15
      t.integer :opp_week_16
      t.integer :opp_week_17
      t.boolean :home_week_1
      t.boolean :home_week_2
      t.boolean :home_week_3
      t.boolean :home_week_4
      t.boolean :home_week_5
      t.boolean :home_week_6
      t.boolean :home_week_7
      t.boolean :home_week_8
      t.boolean :home_week_9
      t.boolean :home_week_10
      t.boolean :home_week_11
      t.boolean :home_week_12
      t.boolean :home_week_13
      t.boolean :home_week_14
      t.boolean :home_week_15
      t.boolean :home_week_16
      t.boolean :home_week_17

      t.timestamps
    end
  end
end
