class AddPointToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :point, :integer
  end
end
