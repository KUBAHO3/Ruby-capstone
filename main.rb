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
  loop do
    options
    number = gets.chomp.to_i
    break if number == 11

    user_input(music_genre_operation, number)
  end
  puts 'Thank you for using our App'
end


def user_input(method, number)
  case number
  when 1 then list_books
  when 2 then method.list_music_albums
  when 3 then list_games
  when 4 then method.list_genres
  when 5 then list_labels
  when 6 then list_authors
  when 7 then add_book
  when 8 then method.add_music
  when 9 then method.create_genre
  when 10 then add_game
  else
    puts 'Invalid number Entered'
  end
end

def list_books
  puts 'book list'
end

def list_games
  # code to list all games
end

def list_labels
  # code to list all labels
end

def list_authors
  # code to list all authors
end

def add_book
  # code to add a new book
end

def add_game
  # code to add a new game
end

connection
