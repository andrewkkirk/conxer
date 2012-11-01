class CreateConnections < ActiveRecord::Migration
  def up
  	create_table :connections do |t|
  		t.text :reason
  		t.boolean :established 
  		t.references :connector
  		t.references :connectee1
  		t.references :connectee2
  		
  		t.timestamps 
  	end
  end

  def down
  	drop_table :connections
  end
end
