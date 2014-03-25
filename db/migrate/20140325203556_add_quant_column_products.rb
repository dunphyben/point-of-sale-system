class AddQuantColumnProducts < ActiveRecord::Migration
  def change
    add_column :products, :quantity, :int
  end
end
