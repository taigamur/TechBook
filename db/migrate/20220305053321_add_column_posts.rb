class AddColumnPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :volume, :integer
  end
end
