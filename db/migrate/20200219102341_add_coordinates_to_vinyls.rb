class AddCoordinatesToVinyls < ActiveRecord::Migration[5.2]
  def change
    add_column :vinyls, :latitude, :float
    add_column :vinyls, :longitude, :float
  end
end
