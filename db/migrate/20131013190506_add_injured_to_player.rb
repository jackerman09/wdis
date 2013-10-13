class AddInjuredToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :injured, :boolean
  end
end
