class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :maker, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true
      t.string :car_name, null: false
      t.integer :year_name, null: false, default: 2
      t.integer :year_number, null: false
      t.text :good_point
      t.text :bad_point
      t.float :fuel_efficiency
      t.integer :riding_capacity

      t.timestamps
    end
  end
end
