class CreateMatchplays < ActiveRecord::Migration
  def change
    create_table :matchplays do |t|
      t.integer :player_id
      t.integer :matchup_id

      t.timestamps
    end
  end
end
