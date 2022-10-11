require_relative 'item'

class Author
  attr_accessor :first_name, :last_name
  attr_reader :items

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @items = []
    @id = Random.rand(1..1000)
  end

  def add_item(item)
    @items.push(item)
    item.add_author = self
  end
end
