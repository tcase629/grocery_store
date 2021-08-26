# Display a menu in the console for the user to interact with.
# 1) View Items Available to purchase 2) Add Items To Cart 3) Display Items In Cart 4) Remove an Item From Cart 5) Total 

# Create a default array of hashes that represent items at a grocery store.
# key value pairs in an array
# Create a menu option to add items to a user's grocery cart.
# Create a menu option to display all the items in the cart.
# Create a menu option to remove an item from the users cart.
# Create a menu option to show the total cost of all the items in the user's cart.
# Add new items to the grocery store.

@total = []
@user_cart = []
@grocery_items = [
  { item_name: "banana", price: 1 },
  { item_name: "bread", price: 4 },
  { item_name: "eggs", price: 3 },
  { item_name: "cheese", price: 3 },
  { item_name: "frozen pizza", price: 6 },
]

def spacer
  puts "_" * 25
  puts ""
end

def main_menu
  spacer
  puts "    DPL Grocery Store"
  puts "_________________________"
  puts "1) View Available Items"
  puts "2) Add Items To Cart"
  puts "3) Display Items In Cart"
  puts "4) Remove an Item From Cart"
  puts "5) View Total"
  puts "6) Add New Items to the Store"
  puts "7) Exit"
end 
    
def user_selection
  main_menu
  choice = gets.to_i
  case choice
  when 1
    view_items
    user_selection
  when 2
    add_item
    user_selection
  when 3
    display_cart
    user_selection
  when 4
    remove_item
    user_selection
  when 5
    view_total
    user_selection
  when 6
    add_store_item
    user_selection
  when 7
    spacer
    puts "Goodbye!"
    exit
  else
    puts "Invalid Choice, Try Again"
    user_selection
  end
end

def view_items
  spacer
#create an array of items to loop over?
  @grocery_items.each_with_index do |item, index|
    puts "#{index + 1}) #{item[:item_name]} - $#{item[:price]}"
  end
end

def add_item
  spacer
  puts "Please choose an item you would like to purchase"
  items = view_items
  # Need to then add item to the cart
  choice = gets.to_i - 1 # To take it back to 0 indexing
  spacer
  puts "You chose #{@grocery_items[choice][:item_name]}, the cost of $#{items[choice][:price]} has been added to the total"
  # Add item to the cart
  @user_cart << @grocery_items[choice][:item_name]
  # Need to also add the total cost and add to the total if multiple items are stored
  @total << @grocery_items[choice][:price]
  
  # Take the item out of inventory

end 

def display_cart
  spacer
  if @user_cart.length == 0
    puts "Your cart is empty"
  else
    @user_cart.each_with_index do |item, index|
    puts "#{index + 1}) #{item}"
    end
  end
end

def remove_item
  spacer
  if @user_cart.length == 0
    puts "There are no items to remove.  Please add items to your cart."
    user_selection
  else
    puts "Select an item to remove"
  end
  display_cart
  choice = gets.to_i - 1
  spacer
  puts "#{@user_cart[choice]} has been removed from your cart"
  @user_cart.delete_at(choice)
  @total.delete_at(choice)
end

def view_total
  spacer
  total = 0
  @total.each do |item|
    total = total + item
  end
  puts "Your total is $#{total}"
  # Or this also works and looks cleaner
  # total = @total.reduce(0, :+)
  # puts "Your total is $#{total}"
end

def add_store_item
  spacer
  puts "Please Enter an Item Name"
  name = gets.chomp
  puts "Enter Price"
  price = gets.to_i
  new_item = { item_name: name, price: price }
  @grocery_items << new_item
  spacer
  puts "Item has been added to the store"
end

# Bonus Objectives to come...

user_selection