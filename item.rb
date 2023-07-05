require 'date'

class Item
  attr_reader :id
  attr_accessor :archived, :genre, :publish_date

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    year = Time.new.year
    year - @publish_date[:year] > 10
  end

  def move_to_archive
    self.archived = can_be_archived?
  end

  def add_genre(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end
end
