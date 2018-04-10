class AddPriceToPanels < ActiveRecord::Migration[5.1]
  def change
    add_monetize :panels, :price, currency: { present: false }
  end
end
