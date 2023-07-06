require_relative 'spec_helper'

RSpec.describe BookHandler do
  let(:books) { [] }
  let(:labels) { [] }
  let(:book_handler) { described_class.new(books, labels) }

  describe '#add_a_book' do
    let(:title) { 'Book Title' }
    let(:color) { 'Red' }
    let(:publisher) { 'Publisher' }
    let(:cover_state) { 'new' }
    let(:publish_date) { '2023-07-05' }

    before do
      allow(book_handler).to receive(:gets).and_return(title, color, publisher, cover_state, publish_date)
      book_handler.add_a_book
    end

    it 'adds a book to the books collection' do
      expect(books.size).to eq(1)
      expect(books.first).to be_an_instance_of(Book)
    end

    it 'adds a label to the labels collection' do
      expect(labels.size).to eq(1)
      expect(labels.first).to be_an_instance_of(Label)
    end
  end

  describe '#list_books' do
    let(:book1) { Book.new('Publisher 1', 'new', '2023-07-01') }
    let(:book2) { Book.new('Publisher 2', 'bad', '2023-07-02') }
    let(:book3) { Book.new('Publisher 3', 'new', '2023-07-03') }

    before do
      books << book1 << book2 << book3
    end
  end

  describe '#list_labels' do
    let(:label1) { Label.new('Title 1', 'Red') }
    let(:label2) { Label.new('Title 2', 'Blue') }

    before do
      labels << label1 << label2
    end
  end
end
