require_relative './genre'
require_relative './music_album'

class Operations
  attr_accessor :genre, :music_album

  def initialize
    @genre = []
    @music_album = []
  end

  def list_music_albums
    puts 'Sorry your music album list is empty' if @music_album.empty?
    @music_album.each_with_index do |album, index|
      puts "(#{index}) Name: '#{album.name}' PublishedAt: '#{album.publish_date}' Onspotify: '#{album.on_spotify}'"
    end
  end

  def list_genres
    puts 'Sorry your genre list is empty' if @genre.empty?
    @genre.each_with_index do |genre, index|
      puts "(#{index}) Name: '#{genre.name}'"
    end
  end

  def add_music
    puts 'Please enter the music Album name'
    name = gets.chomp
    puts 'When did you publish the album? use [DD/MM/YYYY]'
    publish_date = gets.chomp
    puts 'Is it on Spotify?[Y/N]'
    on_spotify = gets.chomp
    on_spotif = %w[yes Yes YES Y y].include?(on_spotify)
    new_album = MusicAlbum.new(name, on_spotif, publish_date)
    @music_album.push(new_album)
    puts "'#{name}' Album is added successfully"
  end

  def create_genre
    puts 'Please enter the genre name'
    name = gets.chomp
    new_genre = Genre.new(name)
    @genre.push(new_genre)
    puts "'#{name}' genre is added successfully"
  end
end
