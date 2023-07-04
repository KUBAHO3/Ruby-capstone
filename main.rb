require './item'

def options
  puts 'Welcome to our Application'
  puts 'Please Choose from below options by number',
       '1-List all books',
       '2-List all music albums',
       '3-List all movies',
       '4-List of games',
       '5-List all genres (e.g "Comedy", "Thriller")',
       '6-List all labels (e.g. Gift, New)',
       '7-List all authors (e.g. Stephen King)',
       '8-List all sources (e.g. From a friend, Online shop)',
       '9-Add a book',
       '10-Add a music album',
       '11-Add a movie',
       '12-Add a game',
       '13-Quit Application'
end

def connection
  loop do
    options
    number = gets.chomp.to_i
    break if number == 13

    user_input(number)
  end
  puts 'Thank you for using our App'
end

def user_input(number)
  case number
  when 1 then list_books
  when 2 then list_music_albums
  when 3 then list_movies
  when 4 then list_games
  when 5 then list_genres
  when 6 then list_labels
  when 7 then list_authors
  when 8 then list_sources
  when 9 then add_book
  when 10 then add_music
  when 11 then add_movie
  when 12 then add_game
  else
    puts 'Invalid number Entered'
  end
end

connection
