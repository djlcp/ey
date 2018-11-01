class RemoveManagerAprrovalFromRequests < ActiveRecord::Migration[5.2]
  def change
    remove_column :requests, :manager_approval, :boolean
  end
end
