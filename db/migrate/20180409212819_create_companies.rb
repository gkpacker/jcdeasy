class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.references :user, foreign_key: true
      t.string :cnpj
      t.string :name
      t.string :street_number
      t.string :address1
      t.string :address2
      t.string :zip_code
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
