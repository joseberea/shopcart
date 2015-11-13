class FixRecipesDescription < ActiveRecord::Migration
  def self.up
    rename_column :recipes, :desctiption, :description
  end
end
