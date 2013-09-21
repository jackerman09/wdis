class AddImgNameToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :image_name, :string
  end
end
