require_relative '../lib/order_item_formatter.rb'

RSpec.describe OrderItemFormatter do


  it "when given a menu item it returns a formatted string" do
    
    fake_value = 1
    fake_item = double(:menuItem, :description => "Chips", :cost => 1.5)
    expect(OrderItemFormatter.format(fake_item,fake_value)).to eq "Chips [1]"

  end
  
end