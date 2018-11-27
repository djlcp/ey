class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :is_admin, :admin
  end
end
