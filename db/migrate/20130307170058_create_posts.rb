class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :email
      t.string :city
      t.string :address
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
    add_index :posts, [:user_id, :category_id, :created_at]
  end
end
