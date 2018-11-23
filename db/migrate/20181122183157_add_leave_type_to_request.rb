class AddLeaveTypeToRequest < ActiveRecord::Migration[5.2]
  def change
  	add_column :requests, :leave_type, :integer
  	change_column_default :requests, :approval, false
  end
end
