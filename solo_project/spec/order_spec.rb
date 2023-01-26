require_relative '../lib/order.rb'

RSpec.describe Order do
  
  it "constructs" do
    new_order = Order.new
    expect(new_order).to be
    expect(new_order.order_items).to be_empty
  end

  describe "#add" do
    context "there are no other of item in order" do
      
      it "adds the item to the order with a quantity of 1" do
        new_order = Order.new
        item = double :menuItem
        new_order.add(item)
        expect(new_order.order_items).to include(item => 1)
      end

    end    
    context "there are other of item in order" do
      
      it "increases the quantity of item in order by 1" do
        new_order = Order.new
        item = double :menuItem
        new_order.add(item)
        new_order.add(item)
        expect(new_order.order_items).to include(item => 2)
      end

    end    
  end
  describe "#delete" do
    context "there are no other of item in order" do
      
      it "removes the item from the order" do
        new_order = Order.new
        item_1 = double :menuItem
        new_order.add(item_1)
        new_order.delete(item_1)
        expect(new_order.order_items).not_to include(item_1 => 1)
      end

    end    
    context "there are other of item in order" do
      
      it "decreases the quantity of item in order by 1" do
        new_order = Order.new
        item_1 = double :menuItem
        new_order.add(item_1)
        new_order.add(item_1)
        new_order.delete(item_1)
        expect(new_order.order_items).to include(item_1 => 1)
      end

    end    
  end

end