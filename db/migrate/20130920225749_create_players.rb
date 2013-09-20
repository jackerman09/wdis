class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :last_name
      t.string :first_name
      t.string :position
      t.integer :team
      t.decimal :pts_week_1
      t.decimal :pts_week_2
      t.decimal :pts_week_3
      t.decimal :pts_week_4
      t.decimal :pts_week_5
      t.decimal :pts_week_6
      t.decimal :pts_week_7
      t.decimal :pts_week_8
      t.decimal :pts_week_9
      t.decimal :pts_week_10
      t.decimal :pts_week_11
      t.decimal :pts_week_12
      t.decimal :pts_week_13
      t.decimal :pts_week_14
      t.decimal :pts_week_15
      t.decimal :pts_week_16
      t.decimal :pts_week_17

      t.timestamps
    end
  end
end
