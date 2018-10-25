class AddCounsellorApprovalToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :counsellor_approval, :boolean
  end
end
