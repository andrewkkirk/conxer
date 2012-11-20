class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.boolean :connectee1_response
      t.boolean :connectee2_response

      t.timestamps
    end
  end
end
