class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.text :description
      t.references :site

      t.timestamps
    end
    add_index :places, :site_id
  end
end
