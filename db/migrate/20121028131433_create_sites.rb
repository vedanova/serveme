class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.references :organisation

      t.timestamps
    end
    add_index :sites, :organisation_id
  end
end
