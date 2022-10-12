require_relative('../classes/book')

describe Book do
  before :all do
    @booksample1 = Book.new('16-09-2022', 'Time Hunt', 'bad')
    @booksample2 = Book.new('16-09-2010', 'Time Hunt', 'good')
  end

  it 'Check if created books are instance of Book class' do
    expect(@booksample1).to be_instance_of Book
  end

  # without calling move to archive
  it 'sets the archived attribute on false while initializing' do
    expect(@booksample1.archived).to eq(false)
  end

  # call move to archive on a book with bad cover
  it 'Check if move to archived works with a book with a bad cover' do
    @booksample1.move_to_archive
    expect(@booksample1.archived).to eq(true)
  end
  # call move to archive on an old book
  it 'Check if an old book (10+) is moved to archives' do
    @booksample2.move_to_archive
    expect(@booksample2.archived).to eq(true)
  end
end
