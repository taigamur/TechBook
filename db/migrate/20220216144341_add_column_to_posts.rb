class AddColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :author, :text
    add_column :posts, :image_url, :text
  end
end
