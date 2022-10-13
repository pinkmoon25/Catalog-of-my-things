require_relative '../helpers/io_reader'
require_relative '../controllers/genre_controller'

class GenreView
  class << self
    def create
      puts 'Creating a genre....'
      puts 'Kindly type the genre name'
      name = IOReader.read
      new_genre = GenreController.create(name)
      puts 'Genre created successfully'
      new_genre
    end

    def save
      puts 'Saving ....'
      GenreController.save
      puts 'Saved'
    end

    def all
      puts 'Loading...'
      data = GenreController.all
      return puts 'No Genre Found' unless data.length.positive?

      data.each_with_index do |item, index|
        puts "#{index}) Name: #{item.name}"
      end
    end
  end
end
