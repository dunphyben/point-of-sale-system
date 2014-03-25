class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.column :name, :varchar
      t.column :product_id, :int

      t.timestamps
    end
  end
end
