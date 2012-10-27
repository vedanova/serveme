class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.references :user
      t.string :name

      t.timestamps
    end
    add_index :organisations, :user_id
  end
end
