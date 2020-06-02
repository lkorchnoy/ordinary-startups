class CreateStartups < ActiveRecord::Migration[6.0]
  def change
    create_table :startups do |t|
      t.string :company
      t.text :innovation
      t.boolean :product
      t.string :location

      t.timestamps
    end
  end
end
