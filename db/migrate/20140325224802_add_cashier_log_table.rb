class AddCashierLogTable < ActiveRecord::Migration
  def change
    create_table :cashier_logs do |t|
      t.column :employee_id, :int
      t.column :log_in, :timestamp
      t.column :log_out, :timestamp
    end
  end
end
