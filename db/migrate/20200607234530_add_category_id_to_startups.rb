class AddCategoryIdToStartups < ActiveRecord::Migration[6.0]
  def change
    add_column :startups, :category_id, :integer
  end
end
