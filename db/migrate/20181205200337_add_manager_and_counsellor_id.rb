class AddManagerAndCounsellorId < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :counsellor_id, :integer, index: true
    add_column :users, :manager_id, :integer, index: true
  end
end
