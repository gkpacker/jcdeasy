class CreatePanels < ActiveRecord::Migration[5.1]
  def change
    create_table :panels do |t|
      t.references :panel_type, foreign_key: true
      t.references :station, foreign_key: true

      t.timestamps
    end
  end
end
