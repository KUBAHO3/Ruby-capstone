require './music_genre_op'

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
  music_genre_operation = Operations.new
  books_operation = 'Books'
  games_operation = 'Games'
  methods_operation = [music_genre_operation, books_operation, games_operation]
  loop do
    options
    number = gets.chomp.to_i
    break if number == 11

    user_input(methods_operation, number)
  end
  puts 'Thank you for using our App'
end

def user_input(methods_operation, number)
  music_genre_operation, = methods_operation
  actions = {
    1 => -> { puts 'This will list a book' },
    2 => -> { music_genre_operation.list_music_albums },
    3 => -> { puts 'This will list the games' },
    4 => -> { music_genre_operation.list_genres },
    5 => -> { puts 'This will list the labels' },
    6 => -> { puts 'This will list the authours' },
    7 => -> { puts 'This will add a book' },
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
