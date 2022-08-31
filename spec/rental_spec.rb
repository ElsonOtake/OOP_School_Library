require 'spec_helper'

describe Rental do
  it "The creation of a new rental needs a Book and a Person" do
    # book = double('book')
    # person = double('person')

    # allow(book).to receive(:title) { "Lord of the rings" }
    # allow(book).to receive(:author) { "Tolkien" }
    # allow(person).to receive(:age) { 24 }
    book = Book.new("Lord of the rings", "Tolkien")
    person = Person.new(24)

    rental = Rental.new(person, book, '2022/08/31')
    expect(rental).to be_instance_of Rental
    expect(rental.person.age).to eq 24
    expect(rental.book.author).to eq "Tolkien"
    expect(rental.book.author).not_to eq "Lord of the rings"
    expect(rental.person.rentals.length).to be > 0
    expect(rental.book.rentals.length).to be > 0
  end
end
