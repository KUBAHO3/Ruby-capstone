require './item'

class MusicAlbum < Item
  attr_accessor :on_spotify
  
  def initialize(on_spotify)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?()
    super
    @can_be_archived? && @on_spotify ? true : false

  end

end