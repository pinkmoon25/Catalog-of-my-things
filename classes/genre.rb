class Genre
  def initialize(name, items)
    @id = 0
    @name = name
    @items = items
  end

  def add_item(item)
    @items << item
  end
end
