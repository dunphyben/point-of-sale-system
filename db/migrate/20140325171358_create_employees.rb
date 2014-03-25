class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.column :last_name, :varchar
      t.column :first_name, :varchar
      t.column :login, :varchar

      t.timestamps
    end
  end
end
