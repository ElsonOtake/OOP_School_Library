require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, name = 'Unknown', parent_permission = 'true')
    super(age, name, parent_permission)
    @classroom = classroom
    @parent_permission = parent_permission
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  # Serialize Foo object with its class name and arguments
  def to_json(*args)
    {
      JSON.create_id  => self.class.name,
      'a'             => [ @classroom, age, name, @parent_permission ]
    }.to_json(*args)
  end
  # Deserialize JSON string by constructing new Foo object with arguments.
  def self.json_create(object)
    new(*object['a'])
  end
end
