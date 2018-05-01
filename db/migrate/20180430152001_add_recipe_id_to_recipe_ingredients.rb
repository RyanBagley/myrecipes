class AddRecipeIdToRecipeIngredients < ActiveRecord::Migration[5.2]
  def change
    add_column :recipe_ingredients, :recipe_id, :integer
  end
end
