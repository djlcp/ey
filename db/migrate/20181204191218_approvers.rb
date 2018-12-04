class Approvers < ActiveRecord::Migration[5.2]
  def change
    create_table :approvers do |t|
      t.string :username
      t.string  :manager
      t.string  :approver

      t.timestamps
  end
end
