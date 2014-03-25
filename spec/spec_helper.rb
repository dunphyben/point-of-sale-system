require 'rspec'
require 'active_record'
require 'shoulda-matchers'

require 'employee'
require 'product'
require 'sale'
require 'category'


database_configuration = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configuration["development"]
ActiveRecord::Base.establish_connection(development_configuration)

RSpec.configure do |config|
  config.after(:each) do
    Employee.all.each { |employee| employee.destroy }
    Product.all.each { |product| product.destroy }
    Sale.all.each { |sale| sale.destroy }
  end
end
