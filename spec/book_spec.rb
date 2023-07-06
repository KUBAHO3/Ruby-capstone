require_relative 'spec_helper'
require 'date'

RSpec.describe Book do
  it 'creates a book' do
    book = Book.new('Joy', 'bad', Date.parse('2010-08-13'))

    expect(book.publisher).to eq('Joy')
  end

  it 'checks if the book is archivable' do
    book1 = Book.new('Joy', 'bad', Date.parse('2010-08-13'))
    expect(book1.can_be_archived?).to eq(true)

    book2 = Book.new('Joy', 'Good', Date.parse('2018-08-13'))
    expect(book2.can_be_archived?).to eq(false)

    book3 = Book.new('Joy', 'Good', Date.parse('2010-10-10'))
    expect(book3.can_be_archived?).to eq(true)
  end
end
