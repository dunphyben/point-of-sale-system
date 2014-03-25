class DropCashierLogTable < ActiveRecord::Migration
  def change
    drop_table :cashier_logs
  end
end
