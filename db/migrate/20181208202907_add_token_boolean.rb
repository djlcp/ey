class AddTokenBoolean < ActiveRecord::Migration[5.2]
  def change
  	add_column :approval_requests, :token_valid, :boolean, default: true
  end
end