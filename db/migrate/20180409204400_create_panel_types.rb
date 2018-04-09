class CreatePanelTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :panel_types do |t|
      t.string :name
      t.string :total_area
      t.string :visible_area
      t.string :security_area
      t.string :impression

      t.timestamps
    end
  end
end
