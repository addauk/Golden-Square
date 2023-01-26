require 'menu_item_formatter'

class InteractiveOrderSystem

  def initialize(menu,io)

    @menu = menu
    @io = io

  end

  def run

    choice = ""
    
    until choice == "6"

      show_options
      choice = @io.gets.chomp

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

        @io.puts "You must choose from one of the available options"

      end

    end

    @io.puts "Goodbye"
  end



  private

  def show_options

    @io.puts "Welcome to my restaurant"
    @io.puts "Please choose from the following options:"
    @io.puts "1. View menu"
    @io.puts "2. Add to order"
    @io.puts "3. Remove from order"
    @io.puts "4. View order"
    @io.puts "5. Complete order"
    @io.puts "6. Quit"

  end

  def show_food_menu

    @io.puts "This is the menu"

    place = 0
    menu.each do |item| 
      place += 1
      @io.puts "#{place} #{MenuItemFormatter.format(item)}"
    end 

  end

  def handle_add_choice(number)
    @io.puts "Enter the desired item number"
    choice = get_number
    if choice.defined? add_to_order(@menu_items[choice-1])
  end

  def add_to_order(item)
    @order_items.add(item)
  end

  def handle_remove_choice(number)

  end

  def delete_from_order(item)
    @order_items.delete(item)
  end

  def show_order
    @io.puts "Add items to order first" if @order_items.empty? 
    place = 0
    total = 0.0
    @order_items.each do |key,value|
      place += 1
      @io.puts "#{place} #{OrderItemFormatter.format(key,value)}"
      total += key.cost * value
    end
    @io.puts "Current Total £#{total}"
  end

  def complete_order
    @io.puts "Add items to order first" if @order_items.empty?

  end


  def get_number
    response = @io.gets
    return response.to_i if response.to_i.to_s == response && response.to_i <= @menu_items.length && response.to_i > 0
    fail "You must enter a valid number"
  end
end