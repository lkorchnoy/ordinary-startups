class RemoveDescriptionFromCategories < ActiveRecord::Migration[6.0]
  def change
      remove_column :categories, :description, :text
  end
end
