require_relative '../helpers/io_reader'
require_relative '../controllers/music_album_controller'
require_relative 'genre_view'

class MusicAlbumView
  def self.add
    create
  end

  def self.create
    puts ['', 'Creating Music Album...']
    print 'What is the publish date (yyyy-mm-dd): '
    publish_date = IOReader.read
    print 'Is it on shopify ? Enter Y for YES and N for NO: '
    on_shopify = IOReader.read.upcase == 'Y'
    puts 'Please add genre for your music album'
    genre = GenreView.create
    music_album = MusicAlbumController.create(publish_date, on_shopify)
    music_album.add_genre = genre
    GenreView.save
    puts 'Genre was added to this music album'
    save
    puts 'Music Album was created successfully'
    music_album
  end

  def self.save
    puts 'Saving ....'
    MusicAlbumController.save
    puts 'Saved'
  end

  def self.all
    puts 'Loading...'
    data = MusicAlbumController.all
    return puts 'No Music Album Found' unless data.length.positive?

    data.each_with_index do |item, index|
      puts "#{index}) Publish Date: #{item.publish_date}, On Spotify: #{item.on_spotify}, Genre: #{item.genre.name}"
    end
  end
end
