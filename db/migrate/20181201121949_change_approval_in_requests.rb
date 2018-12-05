class ChangeApprovalInRequests < ActiveRecord::Migration[5.2]
  def change
  	change_column :requests, :approval, :integer, default: 0
  end
end
