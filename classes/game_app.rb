require 'json'
require_relative 'game'
require_relative 'author'

class GameApp

  def initialize
    @games = []
    @authors = []
  end

  def create_author
    puts 'Enter Author details: '
    print 'First name: '
    first_name = gets.chomp
    print 'Last name: '
    last_name = gets.chomp
    new_author = Author.new(first_name, last_name)
    save_author(first_name, last_name)
    @authors << new_author
    puts 'Author created successfully'
    new_author
  end

  def add_game
    print 'Published Date(dd-mm-yyyy): '
    published_date = gets.chomp
    print 'Multiplayer(Y/N): '
    input = gets.chomp
    if input.downcase == 'y' || input.downcase == 'yes'
      multiplayer = true
    else
      multiplayer = false
    end
    print 'Last played at(date): '
    last_played = gets.chomp
    new_game = Game.new(published_date, multiplayer, last_played)
    puts 'Game created successfully'
    new_author = create_author
    new_game.add_author = new_author
    @games << new_game
    save_game(published_date, multiplayer, last_played, new_game)
  end

  def save_game(published_date, multiplayer, last_played, game)
    if File.size?('./data/games.json')
      file = File.read('./data/games.json')
      games = JSON.parse(file)
      games << {Publish_date: published_date, Multiplayer: multiplayer, Last_played: last_played,
      Author: "#{game.author.first_name} #{game.author.last_name}"}
      File.write('./data/games.json', JSON.pretty_generate(games))
    else
      File.write('./data/games.json',
      JSON.pretty_generate([{Publish_date: published_date, Multiplayer: multiplayer, Last_played: last_played,
        Author: "#{game.author.first_name} #{game.author.last_name}"}]))
    end
  end

  def save_author(first_name, last_name)
    if File.size?('./data/authors.json')
      file = File.read('./data/authors.json')
      authors = JSON.parse(file)
      authors << {Author: "#{first_name} #{last_name}"}
      File.write('./data/authors.json', JSON.pretty_generate(authors))
    else
      File.write('./data/authors.json', JSON.pretty_generate([{Author: "#{first_name} #{last_name}"}]))
    end
  end

end
