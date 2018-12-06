class AddDefaultToApprovalRequests < ActiveRecord::Migration[5.2]
  def change
    change_column :approval_requests, :approval_status, :integer, default: 3
  end
end
