class CreateNewCashierLog < ActiveRecord::Migration
  def change
    create_table :cashier_logs do |t|
      t.column :employee_id, :int
      t.column :InOut, :boolean

      t.timestamps
    end
  end
end
