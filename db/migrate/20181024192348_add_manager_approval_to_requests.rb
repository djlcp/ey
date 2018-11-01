class AddManagerApprovalToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :manager_approval, :boolean
  end
end
