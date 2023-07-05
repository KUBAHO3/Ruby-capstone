require_relative 'book'
require_relative 'label'

def add_book
  puts 'Enter the Book\'s name:'
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

  save_book

  save_label

  puts 'Your Book Has Been Successfully Created!'
end


end