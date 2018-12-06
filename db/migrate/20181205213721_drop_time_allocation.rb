class DropTimeAllocation < ActiveRecord::Migration[5.2]
  def change
    drop_table :time_allocations
  end
end
