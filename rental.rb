class Rental
  attr_reader :person, :book, :date

  def initialize(person, book, date)
    @person = person
    @book = book
    @date = date
    person.rentals << self unless person.rentals.include?(self)
    book.rentals << self unless book.rentals.include?(self)
  end
end
