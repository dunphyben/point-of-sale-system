class Product < ActiveRecord::Base
  has_many :sale
  has_many :employee, :through => :sale
  belongs_to :category
end
