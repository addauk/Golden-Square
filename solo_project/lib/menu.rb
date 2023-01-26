class Menu 

  attr_reader  :menu_items

  def initialize
    @menu_items = []
  end

  def add(item)
    @menu_items << item
  end

end