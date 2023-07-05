require './genre'
require './music_album'

class Operations
    attr_accessor :genre, :music_album

    def initialize
        @genre = []
        @music_album = []
    end

    def list_music_albums
        puts "Sorry your music album list is empty" if @music_album.empty?
        @music_album.each_with_index do |album, index|
            puts "(#{index}) Name: '#{album.name}' PublishedAt: '#{album.published_date}' Onspotify: '#{album.on_spotify}'"
        end
    end

    def list_genres
        puts "Sorry your genre list is empty" if @genres.empty?
        @genre.each_with_index do |genre, index|
            puts "(#{index}) Name: '#{genre.name}'"
        end
    end

    def add_music
        puts "Please enter the music Album name"
        name = gets.chomp
        puts "When did you publish the album?"
        publish_date = gets.chomp
        puts "Is it on Spotify?[Y/N]"
        on_spotify = gets.chomp
        %w[yes YES Y y].include?(on_spotify)
        newAlbum = MusicAlbum.new(name, on_spotify, publish_date)
        @music_album.push(newAlbum)
        puts "'#{name}' is added successfully"
    end
end