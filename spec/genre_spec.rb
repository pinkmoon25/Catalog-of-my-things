require_relative 'spec_helper'
describe Genre do
  before :each do
    @genre = Genre.new('Comedy')
  end
  describe '#new' do
    it 'should take one parameter and return an instance of Genre' do
      @genre.should be_an_instance_of Genre
    end
  end
  describe '#name' do
    it 'should return the correct name' do
      @genre.name.should eql 'Comedy'
    end
  end
end
