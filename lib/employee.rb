class Employee < ActiveRecord::Base
  has_many :sales
  has_many :products, :through => :sale
  has_many :cashier_logs
end
