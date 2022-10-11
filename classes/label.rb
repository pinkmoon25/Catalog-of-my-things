require_relative './item'

class Label
  def initialize(title, color)
    @id = Time.new.to_i
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item)
  end
end
