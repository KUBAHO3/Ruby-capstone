require_relative 'book'
require_relative 'label'

class BookHandler
  attr_accessor :books, :labels

  def initialize(books, labels)
    @books = books
    @labels = labels
  end

  def add_a_book
    puts 'Enter the Book\'s title:'
    title = gets.chomp

    puts 'Enter the Book\'s color:'
    color = gets.chomp

    puts 'Enter the Book\'s publisher:'
    publisher = gets.chomp

    puts 'Enter the Book\'s cover state (new/bad):'
    cover_state = gets.chomp.downcase

    puts 'Enter the Book\'s Published Date:'
    publish_date = gets.chomp

    book = Book.new(publisher, cover_state, publish_date)
    @books << book

    label = Label.new(title, color)
    label.add_label(book)

    @labels << label

    puts '========================================'
    puts 'Your book bas been successfully created!'
    puts '========================================'
  end

  def list_books
    @books.each do |book|
      puts '===================================='
      puts "Publisher: #{book.publisher} "
      puts "Cover Status: #{book.cover_state} "
      puts "published on: #{book.publish_date}"
      puts '===================================='
    end
  end

  def list_labels
    @labels.each { |label| puts "Title: #{label.title} color: #{label.color}" }
  end
end
