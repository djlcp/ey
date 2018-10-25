class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :description
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end
