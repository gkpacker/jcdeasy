class AddPictureToPanels < ActiveRecord::Migration[5.1]
  def change
    add_column :panels, :picture, :string
  end
end
