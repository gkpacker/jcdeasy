class AddPictureToPanelTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :panel_types, :picture, :string
  end
end
