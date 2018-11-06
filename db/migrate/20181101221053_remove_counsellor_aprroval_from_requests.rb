class RemoveCounsellorAprrovalFromRequests < ActiveRecord::Migration[5.2]
  def change
    remove_column :requests, :counsellor_approval, :boolean
  end
end
