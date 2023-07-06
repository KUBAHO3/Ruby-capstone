require_relative 'item'

class MusicAlbum < Item
  attr_reader :publish_date
  attr_accessor :on_spotify, :name

  def initialize(name, on_spotify, publish_date)
    super(publish_date)
    @on_spotify = on_spotify
    @name = name
  end

  def can_be_archived?()
    super && @on_spotify ? true : false
  end
end
