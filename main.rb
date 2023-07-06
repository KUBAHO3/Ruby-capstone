require_relative 'books_operation'
require_relative 'music_genre_op'

def options
  puts '----------------------------------------------',
       'Please Choose from below options by number',
       '1-List all books',
       '2-List all music albums',
       '3-List of games',
       '4-List all genres (e.g "Comedy", "Thriller")',
       '5-List all labels (e.g. Gift, New)',
       '6-List all authors (e.g. Stephen King)',
       '7-Add a book',
       '8-Add a music album',
       '9-create a genre',
       '10-Add a game',
       '11-Quit Application',
       '----------------------------------------------'
end

def connection
  books = []
  labels = []

  music_genre_operation = Operations.new
  books_operation = BookHandler.new(books, labels)
  # games_operation = 'Games'
  methods_operation = [books_operation, music_genre_operation]

  loop do
    options
    number = gets.chomp.to_i
    break if number == 11

    user_input(methods_operation, number, books, labels)
  end

  puts 'Thank you for using our App!'
  music_genre_operation.keeping_data
end

def user_input(methods_operation, number, books, labels)
  books_operation, music_genre_operation = methods_operation

  actions = {
    1 => lambda {
           puts 'No books available in the list yet!' if books.empty?
           books_operation.list_books
         },
    2 => -> { music_genre_operation.list_music_albums },
    3 => -> { puts 'This will list the games' },
    4 => -> { music_genre_operation.list_genres },
    5 => lambda {
           puts 'No labels available in the list yet!' if labels.empty?
           books_operation.list_labels
         },
    6 => -> { puts 'This will list the authours' },
    7 => -> { books_operation.add_a_book },
    8 => -> { music_genre_operation.add_music },
    9 => -> { music_genre_operation.create_genre },
    10 => -> { puts 'This will add a game' }
  }

  action = actions[number]
  if action
    action.call
  else
    puts 'Invalid number entered'
  end
end

connection
