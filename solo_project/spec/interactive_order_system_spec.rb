require_relative '../lib/interactive_order_system.rb'

RSpec.describe InteractiveOrderSystem do
  
  before(:each) do

    
    @fake_menu_item_1 = double(:fake_item, :description => "Chips" , :cost => 1.5)
    @fake_menu_item_2 = double(:fake_item, :description => "Beef Burger", :cost => 5.25)
    @fake_menu_item_3 = double(:fake_item, :description => "Salad", :cost => 3.0)
    fake_menu = double(:menu, :menu_items => [@fake_menu_item_1,@fake_menu_item_2,@fake_menu_item_3])
    @io = double :io
    allow(@io).to receive(:puts).with("Welcome to my restaurant")
    allow(@io).to receive(:puts).with("Please choose from the following options:")
    allow(@io).to receive(:puts).with("1. View menu")
    allow(@io).to receive(:puts).with("2. Add to order")
    allow(@io).to receive(:puts).with("3. Remove from order")
    allow(@io).to receive(:puts).with("4. View order")
    allow(@io).to receive(:puts).with("5. Complete order")
    allow(@io).to receive(:puts).with("6. Quit")
    allow(@io).to receive(:gets).and_return("6")
    allow(@io).to receive(:puts).with("Goodbye")

    @fake_order = double :order

    @order_system = InteractiveOrderSystem.new(fake_menu,@io,@fake_order)
  end

  after(:each) do
    expect(@io).to receive(:gets).and_return("6").ordered
    expect(@io).to receive(:puts).with("Goodbye").ordered
    @order_system.run
  end

  it "presents user with a series of options and allows them to enter a choice or quit" do

    expect(@io).to receive(:puts).with("Welcome to my restaurant").ordered
    expect(@io).to receive(:puts).with("Please choose from the following options:").ordered
    expect(@io).to receive(:puts).with("1. View menu").ordered
    expect(@io).to receive(:puts).with("2. Add to order").ordered
    expect(@io).to receive(:puts).with("3. Remove from order").ordered
    expect(@io).to receive(:puts).with("4. View order").ordered
    expect(@io).to receive(:puts).with("5. Complete order").ordered
    expect(@io).to receive(:puts).with("6. Quit").ordered
      
    
  end

  it "allows the user to see a formatted food menu" do 
    

    expect(@io).to receive(:gets).and_return("1").ordered
    expect(@io).to receive(:puts).with("This is the menu").ordered
    expect(@io).to receive(:puts).with("1. Chips £1.50").ordered
    expect(@io).to receive(:puts).with("2. Beef Burger £5.25").ordered
    expect(@io).to receive(:puts).with("3. Salad £3.00").ordered
    


  end

  context "order is empty" do




    it "allows the user to add a new item to their order" do

      expect(@io).to receive(:gets).and_return("2").ordered
      expect(@io).to receive(:puts).with("Enter the desired item number").ordered
      expect(@io).to receive(:gets).and_return("1").ordered

    end


    it "fails if they try to view the order" do
      expect(@io).to receive(:gets).and_return("4").ordered
      expect(@io).to receive(:puts).with("Add items to order first").ordered
    end

    it "fails when they try to complete the order" do
      expect(@io).to receive(:gets).and_return("5").ordered
      expect(@io).to receive(:puts).with("Add items to order first").ordered
    end

  end

  context "order contains items" do

    before(:each) do

      
      fake_order = double(:order, :order_items => {@fake_menu_item_1.description => 1}, :empty? =>false)




    end

    it "allows the user to view their order including correct total" do
      expect(@io).to receive(:gets).and_return("4").ordered
      expect(@io).to receive(:puts).with("1. Chips [1]")
      expect(@io).to receive(:puts).with("Current Total £1.50")


    end

    xit "allows the user to add an additional existing item to their order" do

    end
    
    xit "allows the user to remove a solo item from their order" do

    end

    xit "allows the user to remove a multiple item from their order" do

    end

   xit "allows the user to complete their order" do

    end

  end



  


end