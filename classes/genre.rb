class Genre
  attr_reader :items, :name

  def initialize(name, items)
    @id = 0
    @name = name
    @items = items
  end

  def add_item(item)
    @items << item
    item.add_genre = self
  end
end
