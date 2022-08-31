require 'spec_helper'

describe Book do

  before :each do
    @book = Book.new("Lord of the rings", "Tolkien")
  end

  describe "#new" do
    it "Takes two parameters and returns a Book object" do
      expect(@book).to be_instance_of Book
    end

    it "Has the title Lord of the rings" do
      expect(@book.title).to eq "Lord of the rings"
    end

    it "Has the author Tolkien" do
      expect(@book.author).to eq "Tolkien"
    end

    it "Has rentals with method length" do
      expect(@book.rentals).to respond_to(:length) 
    end

    it "Has empty rentals array after initialization" do
      expect(@book.rentals.length).to be 0
      expect(@book.rentals.length).to eq 0
      expect(@book.rentals.length).to eql 0
    end

    it "Create instance without parameters" do
      expect { Book.new }.to raise_error(ArgumentError)
    end

    it "Can create new rentals" do
      person = Person.new(64, "Alice")
      @book.add_rentals(person, "2022/08/31")
      expect(@book.rentals.length).to eql 1
      expect(person.rentals.length).to be 1
    end
  end
end
