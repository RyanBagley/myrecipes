class AddMigrationToChefs < ActiveRecord::Migration[5.2]
  def change
    add_column :chefs, :admin, :boolean, default: false
  end
end
