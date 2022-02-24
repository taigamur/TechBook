class AddDifficultyToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :difficulty, :integer
  end
end
