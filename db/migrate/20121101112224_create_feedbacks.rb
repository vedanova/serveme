class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.references :place
      t.string :subject
      t.text :content
      t.string :email
      t.string :phone

      t.timestamps
    end
    add_index :feedbacks, :place_id
  end
end
