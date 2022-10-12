require 'json'

class Storage
  def self.load_books
    return unless File.size?('./books.json')

    file = File.read('./books.json')
    JSON.parse(file)
  end

  def self.load_labels
    return unless File.size?('./labels.json')

    file = File.read('./labels.json')
    JSON.parse(file)
  end
end
