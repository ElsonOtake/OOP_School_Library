require './person'

class Teacher < Person
  attr_reader :specialization
  def initialize(specialization, age, name = 'Unknown', parent_permission = 'true')
    super(age, name, parent_permission)
    @specialization = specialization
    @parent_permission = parent_permission
  end

  def can_use_services?
    true
  end

  # Serialize Foo object with its class name and arguments
  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [@specialization, age, name, @parent_permission]
    }.to_json(*args)
  end

  # Deserialize JSON string by constructing new Foo object with arguments.
  def self.json_create(object)
    new(*object['a'])
  end
end
