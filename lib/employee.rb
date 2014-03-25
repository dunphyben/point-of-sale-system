class Employee < ActiveRecord::Base
  has_many :sale
  has_many :product, :through => :sale
end
