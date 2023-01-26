require_relative '../lib/interactive_order_system.rb'

RSpec.describe InteractiveOrderSystem do
  
  it "presents user with a series of options and allows them to enter a choice" do

    fake_menu = double :menu
    io = double :io
  
    expect(io).to receive(:puts).with("Welcome to my restaurant")
    expect(io).to receive(:puts).with("Please choose from the following options:")
    expect(io).to receive(:puts).with("1. View menu")
    expect(io).to receive(:puts).with("2. Add to order")
    expect(io).to receive(:puts).with("3. Remove from order")
    expect(io).to receive(:puts).with("4. View order")
    expect(io).to receive(:puts).with("5. Complete order")
    expect(io).to receive(:puts).with("6. Quit")
    allow(io).to receive(:gets).and_return("6")
    expect(io).to receive(:puts).with("Goodbye")

    order_system = InteractiveOrderSystem.new(fake_menu,io)
    order_system.run
    
  end

  xit "displays the contents of the food menu" do


  end


end