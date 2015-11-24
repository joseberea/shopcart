class DropParentRefsToChild2 < ActiveRecord::Migration
  def change
    remove_reference(:cart_products, :products, index: true)
  end
end
