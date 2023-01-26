require_relative '../lib/menu.rb'

RSpec.describe Menu do
  
  it "constructs" do
   menu = Menu.new
   expect(menu).to be
   expect(menu.menu_items).to eq [] 
  end

  it "allows me to add menu items and get a list of them" do
    menu = Menu.new
    fake_item_1 = double :menuItem
    fake_item_2 = double :menuItem
    fake_item_3 = double :menuItem
    menu.add(fake_item_1)
    menu.add(fake_item_2)
    menu.add(fake_item_3)
    expect(menu.menu_items).to eq [fake_item_1,fake_item_2,fake_item_3]

  end

end