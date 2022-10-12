require_relative './provider'
require_relative '../models/genre'

class GenreController < Provider
  @file_name = './storage/genres.json'
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
        albums = []
        item.items.map do |album|
          albums << { album_id: album.id }
        end
        data.push({ id: item.id, name: item.name, music_album: albums })
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
