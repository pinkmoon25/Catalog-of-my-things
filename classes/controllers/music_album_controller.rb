require_relative '../models/music_album'
require_relative 'provider'
require 'json'

class MusicAlbumController < Provider
  @file_name = './storage/music_albums.json'

  @music_albums = []

  class << self
    attr_reader :music_albums

    def create(publish_date, on_spotify)
      mus_album = MusicAlbum.new(publish_date, on_spotify)
      @music_albums << mus_album
      mus_album
    end

    def save
      data = []
      @music_albums.each do |item|
        data.push({ publish_date: item.publish_date, on_spotify: item.on_spotify, archived: item.archived,
                    genre: { name: item.genre.name } })
      end
      File.write(@file_name, JSON.generate(data))
    end

    def all
      return @music_albums unless @music_albums.length.zero?

      if File.exist?(@file_name) && !File.read(@file_name).empty?
        file_data = JSON.parse(File.read(@file_name))
        file_data.each do |item|
          music_album = create(item['publish_date'], item['on_spotify'])
          music_album.add_genre = Genre.new(item['genre']['name'])
          music_album.move_to_archive if item['archived']
        end
      end
      @music_albums
    end
  end
end
