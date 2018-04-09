class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
