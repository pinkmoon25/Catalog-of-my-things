require 'json'
require_relative 'game'
require_relative 'author'
require_relative 'load_games'

class GameApp
  def self.create_author
    puts 'Enter Author details: '
    print 'First name: '
    first_name = gets.chomp
    print 'Last name: '
    last_name = gets.chomp
    new_author = Author.new(first_name, last_name)
    save_author(first_name, last_name)
    puts 'Author created successfully'
    new_author
  end

  def self.add_game
    print 'Published Date(dd-mm-yyyy): '
    published_date = gets.chomp
    print 'Multiplayer(Y/N): '
    input = gets.chomp
    multiplayer = input.downcase == 'y' || input.downcase == 'yes'
    print 'Last played at(date): '
    last_played = gets.chomp
    new_game = Game.new(published_date, multiplayer, last_played)
    puts 'Game created successfully'
    new_author = create_author
    new_game.add_author = new_author
    save_game(published_date, multiplayer, last_played, new_game)
  end

  def self.save_game(published_date, multiplayer, last_played, game)
    if File.size?('./data/games.json')
      file = File.read('./data/games.json')
      games = JSON.parse(file)
      games << { Publish_date: published_date, Multiplayer: multiplayer, Last_played: last_played,
                 Author: "#{game.author.first_name} #{game.author.last_name}" }
      File.write('./data/games.json', JSON.pretty_generate(games))
    else
      File.write('./data/games.json',
                 JSON.pretty_generate([{ Publish_date: published_date, Multiplayer: multiplayer,
                                         Last_played: last_played,
                                         Author: "#{game.author.first_name} #{game.author.last_name}" }]))
    end
  end

  def self.save_author(first_name, last_name)
    if File.size?('./data/authors.json')
      file = File.read('./data/authors.json')
      authors = JSON.parse(file)
      authors << { Author: "#{first_name} #{last_name}" }
      File.write('./data/authors.json', JSON.pretty_generate(authors))
    else
      File.write('./data/authors.json', JSON.pretty_generate([{ Author: "#{first_name} #{last_name}" }]))
    end
  end

  def self.list_games
    games = Storage.load_games
    puts 'No games available yet, Please add games' if games.empty?
    games.each_with_index do |game, i|
      puts "#{i}) Author: #{game['Author']}, Published: #{game['Publish_date']},
    Last played: #{game['Last_played']}, Multiplayer: #{game['Multiplayer']}"
    end
  end

  def self.list_all_authors
    authors = Storage.load_authors
    puts 'No authors available yet, Please add authors' if authors.empty?
    authors.each_with_index { |author, i| puts "#{i}) #{author['Author']}" }
  end
end
