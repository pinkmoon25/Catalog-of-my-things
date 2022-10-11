class Genre
  attr_accessor :name
  attr_reader :items

  def initialize(name)
    @id = Random.rand(1..100_000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_genre = self
  end
end
