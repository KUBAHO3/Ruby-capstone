
require_relative 'spec_helper'


RSpec.describe Book do
  describe '#initialize' do
    it 'creates a new book with publisher, cover state, and publish date' do
      book = Book.new('Publisher', 'Cover State', 'Publish Date')
      expect(book.publisher).to eq('Publisher')
      expect(book.cover_state).to eq('Cover State')
      expect(book.publish_date).to eq('Publish Date')
    end
  end


  describe '#can_be_archived?' do
    it 'returns true if the cover state is "bad"' do
      book = Book.new('Publisher', 'bad', 'Publish Date')
      expect(book.can_be_archived?).to be true
    end


    it 'returns the result from the superclass if the cover state is not "bad"' do
      book = Book.new('Publisher', 'new', 'Publish Date')
      expect(book.can_be_archived?).to be false
    end
  end
end
