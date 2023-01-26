class OrderItemFormatter

  def self.format(item,quantity)

    return "#{item.description} [#{quantity}]"

  end

end
