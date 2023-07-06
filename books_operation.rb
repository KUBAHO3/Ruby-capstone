require_relative 'book'
require_relative 'label'

class BookHandler
  attr_accessor :books, :labels

  def initialize(books, labels)
    @books = books
    @labels = labels
  end

  def fetch_json_data(file)
    if File.exist?("db/#{file}.json")
      File.read("db/#{file}.json")
    else
      empty_json = [].to_json
      File.write("db/#{file}.json", empty_json)
      empty_json
    end
  end

  def retrieve_books
    books = JSON.parse(fetch_json_data('books'))
    labels = JSON.parse(fetch_json_data('labels'))

    books.each do |book|
      @books << Book.new(book['publisher'], book['cover_state'], book['publish_date'])
    end

    labels.each do |label|
      @labels << Label.new(label['title'], label['color'])
    end
  end

  def save_book
    new_books = []

    @books.each do |book|
      new_books << { 'id' => book.id,
                     'publisher' => book.publisher,
                     'cover_state' => book.cover_state,
                     'publish_date' => book.publish_date }
    end

    File.write('db/books.json', JSON.pretty_generate(new_books))
  end

  def save_label
    new_labels = []

    @labels.each do |label|
      new_labels << { 'title' => label.title,
                      'color' => label.color }
    end

    File.write('db/labels.json', JSON.pretty_generate(new_labels))
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
