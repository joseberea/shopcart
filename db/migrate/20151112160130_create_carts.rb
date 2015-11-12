class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.string :name
      t.text :description
      t.date :date

      t.timestamps null: false
    end
  end
end
