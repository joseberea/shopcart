class AddParentRefsToChild < ActiveRecord::Migration
  def change
    add_reference :cart_products, :products, index: true
  end
end
