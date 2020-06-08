class AddUserIdToStartups < ActiveRecord::Migration[6.0]
  def change
    add_column :startups, :user_id, :integer
  end
end
