class EditRecipeIngredients < ActiveRecord::Migration[5.2]
  def change
    add_column :recipe_ingredients, :ingredient_id, :integer
  end
end
