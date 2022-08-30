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

  # Serialize Foo object with its class name and arguments
  def to_json(*args)
    {
      JSON.create_id  => self.class.name,
      'a'             => [ bar, baz ]
    }.to_json(*args)
  end
  # Deserialize JSON string by constructing new Foo object with arguments.
  def self.json_create(object)
    new(*object['a'])
  end
end
