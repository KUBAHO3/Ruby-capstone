require_relative 'spec_helper'
require 'date'

RSpec.describe Book do
  it 'creates a book' do
    book = Book.new('Joy', 'bad', { day: 31, month: 5, year: 2000 })

    expect(book.publisher).to eq('Joy')
  end

  it 'checks if the book is archivable' do
    book1 = Book.new('Joy', 'bad', { day: 31, month: 5, year: 2000 })
    expect(book1.can_be_archived?).to eq(true)

    book2 = Book.new('Joy', 'Good', { day: 31, month: 5, year: 2018 })
    expect(book2.can_be_archived?).to eq(false)

    book3 = Book.new('Joy', 'Good', { day: 31, month: 5, year: 2000 })
    expect(book3.can_be_archived?).to eq(true)
  end
end
