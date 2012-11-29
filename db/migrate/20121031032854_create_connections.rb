class CreateConnections < ActiveRecord::Migration
  def up
  	create_table :connections do |t|
  		t.text :reason
  		t.boolean :established
  		t.references :connector
  		t.references :connectee1
  		t.references :connectee2
      t.boolean :connectee1_accepted
      t.boolean :connectee2_accepted

  		t.timestamps
  	end
  end

  def down
  	drop_table :connections
  end
end
