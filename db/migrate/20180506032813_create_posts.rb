class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :img
      t.text :title
      t.string :content
      t.integer :user_id
      t.text :writer_name

      t.timestamps null: false
    end
  end
end
