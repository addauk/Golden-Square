require_relative '../lib/menu_item_formatter.rb'

RSpec.describe MenuItemFormatter do

  it "when given a menu item it returns a formatted string" do
    
    fake_item = double(:menuItem, :description => "Chips", :cost => 1.50)
    expect(MenuItemFormatter.format(fake_item)).to eq "Chips £1.5"

  end
  
end