require 'active_record'
require './lib/employee'
require './lib/sale'
require './lib/product'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def welcome
  puts "Welcome to your POS System"
  main_menu
end

def main_menu
  puts "*"*40, "MAIN MENU", "*"*40
  choice = nil
  until choice == 'x'

    puts "\t1: Cashiers",
         "\t2: Managers",
         "\tx: Exit"

    choice = gets.chomp
    case choice

    when '1'
      cashiers
    when '2'
      managers
    when 'x'
      puts "Goodbye"
    else
      puts "That was not a valid entry. Please try again."
      main_menu
    end
  end
end


def cashiers
  puts "*"*40, "CASHIERS", "*"*40

  puts "\tEnter your login name to start your shift: "

  input = gets.chomp

  if employees.login.include? input
    puts "\t'#{login}' is now logged in.\n\n"
  else
    puts "\tUser not recognized. Please try again.\n\n"

  end
end


def managers
  puts "*"*40, "MANAGERS", "*"*40

  # puts "\tEnter your login name to access cool managerial stuff\n"
  puts "Press 'a' to add a new employee to the system."
  puts "Press 'p' to add new product to the system."
  puts "Press 'x' to return to the main menu."

  input = gets.chomp.downcase
  case input
  when 'a'
    add_employee
  when 'p'
    add_product
  when 'x'
    main_menu
  else
    puts "That is not a valid input."
    managers
  end
end


def add_employee
  puts "What is the employee's first name?"
  first_name = gets.chomp
  puts "What is the employee's last name?"
  last_name = gets.chomp
  puts "What will the employee's login be?"
  login = gets.chomp
  new_employee = Employee.create({ :last_name => last_name, :first_name => first_name, :login => login })
  puts "New Employee added.\n"
  managers
end

def add_product
  puts "\n\nWhat product would you like to add?"
  product_name = gets.chomp
  puts "What is the price of this product?"
  product_price = gets.chomp
  puts "What category does this product belong to?"
  category_name = gets.chomp
  new_product = Product.create({ name: product_name, price: product_price, category: category_name})
  puts "The product '#{product_name}' has been added to category '#{category_name}' at the price of '$#{product_price}'.\n\n"
  managers
end



welcome
