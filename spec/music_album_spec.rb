require_relative 'spec_helper'
require 'date'
describe MusicAlbum do
  before :each do
    @music_album = MusicAlbum.new('2020-02-02', false)
  end

  describe '#new' do
    it 'should be an Item' do
      @music_album.should be_an(Item)
    end
    it 'should take two parameter and return an instance of MusicAlbum' do
      @music_album.should be_an_instance_of MusicAlbum
    end
  end

  describe '#publish_date' do
    it 'should return a date object ' do
      @music_album.publish_date.should be_an_instance_of Date
    end
    it 'should return the correct publish date' do
      @music_album.publish_date.should eql Date.parse('2020-02-02')
    end
  end

  describe '#on_spotify' do
    it 'should return a correct value ' do
      @music_album.on_spotify.should eql false
    end
  end

  describe '#archived' do
    it 'should return a correct value ' do
      @music_album.archived.should eql false
    end
  end
end
