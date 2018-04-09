class CreateStationsLines < ActiveRecord::Migration[5.1]
  def change
    create_table :stations_lines do |t|
      t.references :station, foreign_key: true
      t.references :line, foreign_key: true
    end
  end
end
