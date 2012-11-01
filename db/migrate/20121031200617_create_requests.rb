class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :place
      t.string :type

      t.timestamps
    end
    add_index :requests, :place_id
    add_index :requests, :type
    add_index :requests, [:place_id, :type]
  end
end
