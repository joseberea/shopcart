class CreateRecipeProducts < ActiveRecord::Migration
  def change
    create_table :recipe_products do |t|
      t.references :recipe, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
