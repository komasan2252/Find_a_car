class AddStarToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :star, :integer, default: 0, null: false
  end
end
