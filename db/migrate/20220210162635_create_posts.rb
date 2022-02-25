class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :name
      t.text :content_public
      t.text :content_private

      t.timestamps
    end
  end

end
