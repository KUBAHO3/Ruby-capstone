require_relative 'book'
require_relative 'label'
require_relative 'book_handler'

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

    it 'outputs the success message' do
      success_message = "Your book has been successfully created!\n========================================\n"
      expect { book_handler.add_a_book }.to output(success_message).to_stdout
    end
  end

  describe '#list_books' do
    let(:book1) { Book.new('Publisher 1', 'new', '2023-07-01') }
    let(:book2) { Book.new('Publisher 2', 'bad', '2023-07-02') }
    let(:book3) { Book.new('Publisher 3', 'new', '2023-07-03') }

    before do
      books << book1 << book2 << book3
    end

    it 'outputs the details of each book' do
      expect { book_handler.list_books }.to output(
        <<~EXPECTED_OUTPUT
          ====================================
          Publisher: Publisher 1
          Cover Status: new
          published on: 2023-07-01
          ====================================
          Publisher: Publisher 2
          Cover Status: bad
          published on: 2023-07-02
          ====================================
          Publisher: Publisher 3
          Cover Status: new
          published on: 2023-07-03
          ====================================
        EXPECTED_OUTPUT
      ).to_stdout
    end
  end

  describe '#list_labels' do
    let(:label1) { Label.new('Title 1', 'Red') }
    let(:label2) { Label.new('Title 2', 'Blue') }

    before do
      labels << label1 << label2
    end

    it 'outputs the details of each label' do
      expect { book_handler.list_labels }.to output(
        <<~EXPECTED_OUTPUT
          Title: Title 1 color: Red
          Title: Title 2 color: Blue
        EXPECTED_OUTPUT
      ).to_stdout
    end
  end
end
