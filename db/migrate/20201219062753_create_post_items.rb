class CreatePostItems < ActiveRecord::Migration[5.2]
  def change
    create_table :post_items do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.string :image_id
      t.integer :genre_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
