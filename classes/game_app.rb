require 'json'
require_relative 'game'
require_relative 'author'
require_relative 'load_storage'

class GameApp
  @game_file = './storage/games.json'
  @author_file = './storage/authors.json'

  def self.create_author
    puts 'Enter Author details: '
    print 'First name: '
    first_name = gets.chomp
    print 'Last name: '
    last_name = gets.chomp
    new_author = Author.new(first_name, last_name)
    save_author(new_author)
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
    save_game(new_game)
  end

  def self.save_game(game)
    if File.size?(@game_file)
      file = File.read(@game_file)
      games = JSON.parse(file)
      games << { Publish_date: game.publish_date, Multiplayer: game.multiplayer,
                 Last_played: game.last_played_at,
                 Author: "#{game.author.first_name} #{game.author.last_name}" }
      File.write(@game_file, JSON.pretty_generate(games))
    else
      File.write(@game_file,
                 JSON.pretty_generate([{ Publish_date: game.publish_date, Multiplayer: game.multiplayer,
                                         Last_played: game.last_played_at,
                                         Author: "#{game.author.first_name} #{game.author.last_name}" }]))
    end
  end

  def self.save_author(author)
    if File.size?(@author_file)
      file = File.read(@author_file)
      authors = JSON.parse(file)
      authors << { Author: "#{author.first_name} #{author.last_name}", Id: author.id }
      File.write(@author_file, JSON.pretty_generate(authors))
    else
      File.write(@author_file, JSON.pretty_generate([{ Author: "#{author.first_name} #{author.last_name}",
                                                       Id: author.id }]))
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
    authors.each_with_index { |author, i| puts "#{i}) #{author['Author']} Id: #{author['Id']}" }
  end
end
