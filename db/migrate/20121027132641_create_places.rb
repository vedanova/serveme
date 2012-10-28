class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.text :description
      t.references :organisation

      t.timestamps
    end
    add_index :places, :organisation_id
  end
end
