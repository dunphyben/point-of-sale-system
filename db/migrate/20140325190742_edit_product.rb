class EditProduct < ActiveRecord::Migration
  def change
    remove_column :products, :category
    remove_column :categories, :product_id
    add_column :products, :category_id, :int
  end
end
