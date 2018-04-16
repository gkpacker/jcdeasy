class AddArtToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :art, :string
  end
end
