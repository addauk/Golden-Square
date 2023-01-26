require_relative '../lib/menu_item.rb'

RSpec.describe MenuItem do
  
  it "constructs and allows you to access description and cost" do

    menu_item = MenuItem.new("Chips",1.5)

    expect(menu_item.cost).to eq 1.5
    expect(menu_item.description).to eq "Chips"
  end

end