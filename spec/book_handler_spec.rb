require_relative 'spec_helper'

RSpec.describe BookHandler do
  describe '#initialize' do
    it 'creates a new book handler with empty books and labels' do
      handler = BookHandler.new([], [])
      expect(handler.books).to be_an(Array)
      expect(handler.books).to be_empty
      expect(handler.labels).to be_an(Array)
      expect(handler.labels).to be_empty
    end
  end

  describe '#add_a_book' do
    it 'adds a book and label to the book handler' do
      books = []
      labels = []
      handler = BookHandler.new(books, labels)

      allow(STDIN).to receive(:gets).and_return('Title', 'Color', 'Publisher', 'new', 'Publish Date')
      handler.add_a_book

      expect(handler.books.size).to eq(1)
      expect(handler.labels.size).to eq(1)
      expect(handler.books.first.publisher).to eq('Publisher')
      expect(handler.labels.first.title).to eq('Title')
    end
  end

  describe '#list_books' do
    it 'displays information for each book in the book handler' do
      books = [double('Book', publisher: 'Publisher1', cover_state: 'new', publish_date: 'Date1'),
               double('Book', publisher: 'Publisher2', cover_state: 'bad', publish_date: 'Date2')]
      labels = []
      handler = BookHandler.new(books, labels)

      expect { handler.list_books }.to output(
        "====================================\n" \
        "
