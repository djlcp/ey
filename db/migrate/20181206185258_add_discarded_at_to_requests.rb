class AddDiscardedAtToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :discarded_at, :datetime
    add_index :requests, :discarded_at
  end
end
