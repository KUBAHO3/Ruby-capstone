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
end