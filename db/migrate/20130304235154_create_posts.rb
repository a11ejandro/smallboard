class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :city
      t.text :content
      t.string :picture
      t.string :email
      t.string :address
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
