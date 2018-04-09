class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :panel, foreign_key: true
      t.string :date
      t.string :duration
      t.integer :quantity

      t.timestamps
    end
  end
end
