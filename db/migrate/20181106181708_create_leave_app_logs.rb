class CreateLeaveAppLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :leave_app_logs do |t|
      t.string :fkey_request
      t.string :username
      t.string :role
      t.datetime :date_time
      t.boolean :approval

      t.timestamps
    end
  end
end
