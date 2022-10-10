class Item
  attr_reader :genre, :author, :source, :label, :publish_date

  def initialize(id, publish_date, archived)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  def add_genre=(genre)
    @genre = genre
    genre.add_item(self)
  end

  def add_source=(source)
    @source = source
    source.add_item(self)
  end

  def add_author=(author)
    @author = author
    author.add_item(self)
  end

  def add_label=(label)
    @label = label
    label.add_item(self)
  end
end
