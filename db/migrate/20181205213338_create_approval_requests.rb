class CreateApprovalRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :approval_requests do |t|
      t.references :request
      t.references :approver
      t.string :token
      t.boolean :approved, default: false

      t.timestamps
    end
  end
end
