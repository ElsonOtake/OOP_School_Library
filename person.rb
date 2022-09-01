require './nameable'
require './rental'

class Person < Nameable
  attr_reader :id, :rentals, :parent_permission
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission = 'true')
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rentals(book, date)
    new_rental = Rental.new(self, book, date)
    @rentals << new_rental unless @rentals.include?(new_rental)
  end

  private

  def of_age?
    @age.to_i >= 18
  end
end
