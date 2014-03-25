require 'rspec'
require 'active_record'
require 'shoulda-matchers'

require 'employee'
require 'product'
require 'sale'
require 'category'
require 'cashier_log'


database_configuration = YAML::load(File.open('./db/config.yml'))
test_configuration = database_configuration["development"]
ActiveRecord::Base.establish_connection(test_configuration)

RSpec.configure do |config|
  config.after(:each) do
    Employee.all.each { |employee| employee.destroy }
    Product.all.each { |product| product.destroy }
    Sale.all.each { |sale| sale.destroy }
    Category.all.each { |category| category.destroy }
  end
end
