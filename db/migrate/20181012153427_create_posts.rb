class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :title
      t.text :content
      t.integer :user_id
      t.integer :hit
      t.text :hashtag

      t.timestamps null: false
    end
  end
end
