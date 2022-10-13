require 'json'

class Storage
  def self.load_games
    return unless File.size?('./storage/games.json')

    file = File.read('./storage/games.json')
    JSON.parse(file)
  end

  def self.load_authors
    return unless File.size?('./storage/authors.json')

    file = File.read('./storage/authors.json')
    JSON.parse(file)
  end
end
