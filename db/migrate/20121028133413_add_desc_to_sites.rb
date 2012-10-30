class AddDescToSites < ActiveRecord::Migration
  def change
    add_column :sites, :description, :text
  end
end
