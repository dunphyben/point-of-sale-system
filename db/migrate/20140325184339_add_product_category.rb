class AddProductCategory < ActiveRecord::Migration
  def change
    add_column :products, :category, :varchar
  end
end
