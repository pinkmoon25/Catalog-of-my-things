require_relative './provider'
require_relative '../models/genre'

class GenreController < Provider
  @file_name = './classes/storage/genres.json'
  @genres = []

  class << self
    attr_reader :genres

    def create(genre_name)
      genre = Genre.new(genre_name)
      @genres << genre
      genre
    end

    def save
      data = []
      @genres.each do |item|
        data.push({ name: item.name, items: item.items })
      end
      File.write(@file_name, JSON.generate(data))
    end

    def all
      return @genres unless @genres.length.zero?

      if File.exist?(@file_name) && !File.read(@file_name).empty?
        file_data = JSON.parse(File.read(@file_name))
        file_data.each do |item|
          create(item['name'])
        end
      end
      @genres
    end
  end
end
