class CreateTimeAllocations < ActiveRecord::Migration[5.2]
  def change
    create_table :time_allocations do |t|
      t.integer :user_id
      t.integer :client_id
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end
