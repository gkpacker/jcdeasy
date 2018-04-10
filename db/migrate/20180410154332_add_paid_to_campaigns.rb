class AddPaidToCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :paid?, :boolean, default: false
  end
end
