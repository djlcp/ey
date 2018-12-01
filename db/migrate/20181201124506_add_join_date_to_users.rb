class AddJoinDateToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :join_date, :date
  end
end
