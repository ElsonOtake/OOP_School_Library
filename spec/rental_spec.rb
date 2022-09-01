require 'spec_helper'

describe Rental do
  before :each do
    @book = Book.new('Lord of the rings', 'Tolkien')
    @person = Person.new(24)
    @rental = Rental.new(@person, @book, '2022/08/31')
  end
  describe '#new' do
    it 'rental Should be class of Rental' do
      expect(@rental).to be_instance_of Rental
    end

    it 'the rental book author and name should be Tolkien and Lord of the ring' do
      expect(@rental.book.author).to eq 'Tolkien'
      expect(@rental.book.title).to eq 'Lord of the rings'
    end

    it 'person should be an instance of Person' do
      expect(@rental.person).to be_instance_of Person
      expect(@rental.person.name).to eq 'Unknown'
      expect(@rental.person.age).to be 24
    end

    it 'book should be an instance of Book' do
      expect(@rental.book).to be_instance_of Book
    end

    it 'should have a rental' do
      expect(@rental.person.rentals.length).to be > 0
      expect(@rental.book.rentals.length).to be > 0
    end
  end
end
