class AddLatitudeToStations < ActiveRecord::Migration[5.1]
  def change
    add_column :stations, :latitude, :float
  end
end
