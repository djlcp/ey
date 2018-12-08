class AddManagerBoolean < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_manager, :boolean, default: false
  end
end
