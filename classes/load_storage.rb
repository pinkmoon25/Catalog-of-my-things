require 'json'

class Storage
  def self.load_games
    return unless File.size?('./data/games.json')

    file = File.read('./data/games.json')
    JSON.parse(file)
  end

  def self.load_authors
    return unless File.size?('./data/authors.json')

    file = File.read('./data/authors.json')
    JSON.parse(file)
  end
end
