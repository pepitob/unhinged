class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :category
      t.text :description
      t.integer :capacity
      t.string :location
      t.float :price
      t.float :global_rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
