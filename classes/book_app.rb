require 'json'
require_relative 'book'
require_relative 'label'
require_relative 'load_books'

class BookApp
  def self.add_label
    puts 'Enter Label details'
    print 'Enter the label title: '
    label_title = gets.chomp
    print 'Enter label color: '
    label_color = gets.chomp
    new_label = Label.new(label_title, label_color)
    save_label(new_label)
    puts 'Label created successfully'
    new_label
  end

  def self.create_book
    puts 'Enter Book details: '
    print 'Enter the Date 🚨 DAY-MONTH-YEAR 🚨 : '
    publish_date = gets.chomp
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover state: '
    cover_state = gets.chomp
    new_book = Book.new(publish_date, publisher, cover_state)
    puts 'Book created successfully'
    x = add_label
    new_book.add_label = x
    save_book(new_book)
  end

  def self.save_book(book)
    if File.size?('./storage/books.json')
      file = File.read('./storage/books.json')
      books = JSON.parse(file)
      books << { publisher: book.publisher, cover_state: book.cover_state }
      File.write('./storage/books.json', JSON.pretty_generate(books))
    else
      File.write('./storage/books.json',
                 JSON.pretty_generate([{ publisher: book.publisher, cover_state: book.cover_state }]))
    end
  end

  def self.save_label(label)
    if File.size?('./storage/labels.json')
      file = File.read('./storage/labels.json')
      labels = JSON.parse(file)
      labels << { title: label.title, color: label.color }
      File.write('./storage/labels.json', JSON.pretty_generate(labels))
    else
      File.write('./storage/labels.json', JSON.pretty_generate([{ title: label.title, color: label.color }]))
    end
  end

  def self.list_all_books
    books = Storage.load_books
    puts 'Book storage is empty' if books.empty?
    puts 'Available Books 📚 '
    puts '-------------------'
    books.each_with_index do |book, i|
      puts "[#{i + 1})] Publisher: #{book['publisher']} <br>     Cover-state: #{book['cover_state']}".split('<br>')
    end
  end

  def self.list_all_labels
    labels = Storage.load_labels
    puts 'Label storage is empty' if labels.empty?
    puts 'Available Labels 🏷️ '
    puts '-------------------'
    labels.each_with_index do |label, i|
      puts "[#{i + 1}] title: #{label['title']} <br>    color: #{label['color']}".split('<br>')
    end
  end
end
