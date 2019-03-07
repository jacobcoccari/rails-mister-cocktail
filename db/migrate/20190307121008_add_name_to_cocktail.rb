class AddNameToCocktail < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :name, :string
  end
end
