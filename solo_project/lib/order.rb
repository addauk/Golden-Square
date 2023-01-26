class Order 

  attr_reader :order_items

  def initialize
    @order_items = Hash.new
  end

  def add(item)
    if order_items.key?(item)
      order_items[item] += 1
    else
      order_items[item] = 1
    end

  end

  def delete(item)
    if order_items[item] > 1
      order_items[item] -= 1
    else
      order_items.delete(item)
    end
  end

  def empty?
    return @order_items.empty?
  end

end