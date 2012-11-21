class AddPermissionToConnection < ActiveRecord::Migration
  def change
  	add_column :connections, :permission_id, :integer 
  end
end
