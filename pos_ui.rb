require 'active_record'
require './lib/employee'
require './lib/sale'
require './lib/product'
require './lib/category'
require './lib/cashier_log'

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

#***********************************************

def cashiers
  puts "*"*40, "CASHIERS", "*"*40

  puts "Would you like to log in, or log out? (I/O)"
  user_input = gets.chomp.downcase

  case user_input
  when 'i'
    log_in
  when 'o'
    log_out
  else
    puts "Not a valid input."
    cashiers
  end
end

def log_in
  puts "\tEnter your login information to start your shift: "
  cashier_login = gets.chomp

  signed_in_employee = Employee.find_by(:login => cashier_login)
  unless signed_in_employee == nil
    signed_in_employee.cashier_logs.create({ :InOut => true })
    puts "You are now signed in.\n"
  end
  cashiers
end


def log_out
   puts "\tEnter your login information to finish your shift: "
  cashier_login = gets.chomp

  signed_in_employee = Employee.find_by(:login => cashier_login)
  unless signed_in_employee == nil
    signed_in_employee.cashier_logs.create({ :InOut => false })
    puts "You are now signed out.\n"
  end
  cashiers
end

#************************************************

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
  puts "\n\nNew Employee #{last_name}, #{first_name} added to the employee database with the username #{login}.\n\n"
  managers
end

def add_product
  puts "\n\nWhat product would you like to add?"
  product_name = gets.chomp
  puts "What is the price of this product?"
  product_price = gets.chomp
  puts "What category does this product belong to?"
  category_name = gets.chomp
  new_category = Category.create({ :name => category_name })
  puts "How many items are you adding to inventory?"
  inventory_amount = gets.chomp
  new_category.products.create({ :name => product_name, :price => product_price, :quantity => inventory_amount })
  puts "\n\n'#{inventory_amount}' of the product '#{product_name}' has been added at the price of '$#{product_price}'.\n\n"
  managers
end

def increase_existing_inventory

end



welcome
