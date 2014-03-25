class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.column :employee_id, :int
      t.column :product_id, :int

      t.timestamps
    end
  end
end
