require_relative '../classes/game'
require_relative '../classes/item'

RSpec.describe Game do
  describe '#game' do
    it 'should be a child of Item Class' do
      game = Game.new('10-10-2010', true, '10-10-2022')
      expect(game).to be_a(Item)
    end
  end
  describe '#new Game' do
    it 'should be an instance of Game class' do
      new_game = Game.new('10-10-2010', true, '10-10-2022')
      expect(new_game).to be_instance_of Game
    end
  end
  describe 'game with last played at older than 2 years' do
    it 'should be able to be archived' do
      game = Game.new('10-10-2010', true, '10-10-2018')
      game.move_to_archive
      expect(game.archived).to be true
    end
  end 
  describe 'game with last played at not older than 2 years' do
    it 'should not be able to be archived' do
      game = Game.new('10-10-2010', true, '10-10-2021')
      game.move_to_archive
      expect(game.archived).to be false
    end
  end 
end
