class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = "Unknown", parent_permission = true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def is_of_age?
    @age.to_i >= 18 ? true : false
  end

  def can_use_services?
    is_of_age? || @parent_permission ? true : false
  end
end

person = Person.new('Rosely', 24)
p person.name
p person.id
p person.age
p person.is_of_age?
p person.can_use_services?
