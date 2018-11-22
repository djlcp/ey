class AddTypeToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :type_of_request, :string
  end
end
