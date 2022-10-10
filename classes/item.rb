require 'date'

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

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    current_year = Date.today.year
    publish_year = Date.parse(publish_date).year
    (current_year - publish_year) > 10
  end
end
