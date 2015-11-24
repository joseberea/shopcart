class DropParentRefsToChild < ActiveRecord::Migration
  def change
    remove_reference(:cart_products, :products, index: true)
  end
end
