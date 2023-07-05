require_relative 'book'
require_relative 'label'

def add_book
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
  label.add_item(book)

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

# def handle_books
#     puts 'Choose an option'

#     puts '1- List all books'
#     puts '2- List all labels (e.g. Gift, New)'
#     puts '3- Add a book'
#     puts '4- Back'

#     choice = gets.chomp.to_i

#     case choice
#     when 1
#       return puts 'No books available in the list yet!' if @books.empty?

#       list_books
#     when 2
#       return puts 'No labels available in the list yet!' if @labels.empty?

#       list_labels
#     when 3
#       add_book
#     when 4
#       nil
#     end
# end
