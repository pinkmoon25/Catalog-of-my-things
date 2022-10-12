require_relative '../classes/author'
require_relative '../classes/item'

RSpec.describe Author do
  describe '#new_author' do
    it 'should be an instance of Author class' do
      new_author = Author.new('Tushar', 'Singh')
      expect(new_author).to be_an_instance_of Author
    end
  end
  describe 'Adding an Item object' do
    it 'should add item to items collection of author' do
      new_item = Item.new('12-10-2022')
      new_author = Author.new('Shikhar', 'singh')
      new_author.add_item(new_item)
      expect(new_author.items).to include(new_item)
    end
  end
end
