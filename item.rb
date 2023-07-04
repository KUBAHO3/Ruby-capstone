require 'date'

class Item
  attr_reader :id, :publish_date
  attr_accessor :archived

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

end
