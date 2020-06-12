class AddSearchToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :search, :string
  end
end
