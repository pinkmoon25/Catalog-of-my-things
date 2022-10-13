require 'json'

class Storage
  def self.load_books
    return unless File.size?('./storage/books.json')

    file = File.read('./storage/books.json')
    JSON.parse(file)
  end

  def self.load_labels
    return unless File.size?('./storage/labels.json')

    file = File.read('./storage/labels.json')
    JSON.parse(file)
  end
end
