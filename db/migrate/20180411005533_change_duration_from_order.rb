class ChangeDurationFromOrder < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :duration, 'integer USING duration::integer'
  end
end
