class AddStatusToCartProducts < ActiveRecord::Migration
  def change
    add_column :cart_products, :status, :string
  end
end
