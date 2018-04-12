class AddPriceCentsToPanelTypes < ActiveRecord::Migration[5.1]
  def change
    add_monetize :panel_types, :price, currency: { present: false }
  end
end
