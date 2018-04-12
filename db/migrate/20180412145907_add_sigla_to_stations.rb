class AddSiglaToStations < ActiveRecord::Migration[5.1]
  def change
    add_column :stations, :sigla, :string
  end
end
