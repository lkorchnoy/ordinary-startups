class RemoveSearchFromCategories < ActiveRecord::Migration[6.0]
  def change

    remove_column :categories, :search, :string
  end
end
