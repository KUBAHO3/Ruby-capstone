require_relative '../author'
require_relative '../item'

RSpec.describe Author do
  describe '#add_item' do
    it 'adds the item to the author\'s collection of items' do
      author = Author.new(1, 'John', 'Doe')
      item = Item.new(Date.today)
      author.add_item(item)
      expect(author.items).to include(item)
    end

    it 'sets the author as the property of the item' do
      author = Author.new(1, 'John', 'Doe')
      item = Item.new(Date.today)
      author.add_item(item)
      expect(item.author).to eq(author)
    end
  end
end
