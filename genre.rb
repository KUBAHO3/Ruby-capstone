class Genre
  attr_reader :id
  attr_accessor :items, :name

  def initialize(name, items = [])
    @id = Random.rand(1..1000)
    @name = name
    @items = items
  end

  def add_item(item)
    @items << item
  end
end
