require './rental'

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rentals(person, date)
    new_rental = Rental.new(person, self, date)
    @rentals << new_rental unless @rentals.include?(new_rental)
  end
end
