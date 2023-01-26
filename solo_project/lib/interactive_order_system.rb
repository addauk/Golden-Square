require_relative './menu_item_formatter'
require_relative './order_item_formatter'
require_relative './menu'
require_relative './menu_item'
require_relative './order'
require_relative './message_sender'



class InteractiveOrderSystem

  def initialize(menu)

    @menu = menu
    @order_items = Order.new

  end

  def run

    choice = ""
    
    until choice == "6"

      show_options
      choice = gets.chomp

      case choice
      when "1"
        #Viewing menu
        show_food_menu
      when "2"
        #Adding to order
        handle_add_choice
      when "3"
        #Removing from order
        handle_remove_choice
      when "4"
        #Viewing order
        show_order
      when "5"
        #Completing order
        complete_order
      when "6"
        #Quitting
      else

        puts "You must choose from one of the available options"

      end

    end

    puts "Goodbye"
  end



  private

  def show_options

    puts "Welcome to my restaurant"
    puts "Please choose from the following options:"
    puts "1. View menu"
    puts "2. Add to order"
    puts "3. Remove from order"
    puts "4. View order"
    puts "5. Complete order"
    puts "6. Quit"

  end

  def show_food_menu

    puts "This is the menu"

    place = 0
    @menu.menu_items.each do |item| 
      place += 1
      puts "#{place}. #{MenuItemFormatter.format(item)}"
    end 

  end

  def handle_add_choice
    puts "Enter the desired item number"
    choice = get_number
    if defined?(choice) 
      add_to_order(@menu.menu_items[choice-1])
    end
  end

  def add_to_order(item)
    @order_items.add(item)
    puts "#{item.description} removed"
  end

  def handle_remove_choice
    if @order_items.empty? 
      puts "Add items to order first" 
    else
      puts "Enter the desired item number"
      choice = get_number
      if defined?(choice) 
        delete_from_order(@menu.menu_items[choice-1])
      end
    end
  end

  def delete_from_order(item)
    @order_items.delete(item)
    puts "#{item.description} removed"
  end

  def show_order
    if @order_items.empty? 
      puts "Add items to order first" 
       
    else
      place = 0
      total = 0.0
      @order_items.order_items.each do |key,value|
        place += 1
        puts "#{place}. #{OrderItemFormatter.format(key,value)}"
        total += key.cost * value
      end
      puts "Current Total £#{'%.2f' % total}"
    end
  end

  def complete_order
    if @order_items.empty?
      puts "Add items to order first" 
    else
      MessageSender.send
      @order_items = Order.new
    end

  end


  def get_number
    response = gets.chomp
    if response.to_i.to_s == response && response.to_i <= @menu.menu_items.length && response.to_i > 0
      return response.to_i 
    end
    puts "You must enter a valid number"
  end
end

# menu = Menu.new
# menu.add(MenuItem.new("Chips", 1.50))
# menu.add(MenuItem.new("Beef Burger", 5.25))
# menu.add(MenuItem.new("Salad", 3.00))
# ios = InteractiveOrderSystem.new(menu)
# ios.run