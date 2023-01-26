class MenuItemFormatter

  def self.format(item)

    return "#{item.description} £#{'%.2f' %item.cost}"

  end

end