require './check_input'

class AllPeoples
  include CheckInput

  def initialize(app)
    @app = app
    @type = ''
    @age = ''
    @name = ''
    @permission = ''
    @specialization = ''
    @id = ''
  end

  def list_all_people
    puts 'The people list is empty!' if @app.list_people.length.zero?
    @app.list_people.each do |people|
      puts "[#{people.class}] Name: #{people.name}, ID: #{people.id}, Age: #{people.age}"
    end
  end

  def create_a_person
    @type = check_input('Do you want to create a student (1) or a teacher (2)? [Input the number]: ') do
      %w[1 2].include?(@option)
    end
    @age = check_input('Age: ') { @option.match?(/^\d+$/) }
    @name = check_input('Name: ') { @option != '' }
    if @type == '1'
      @permission = check_input('Has parent permission? [Y/N]: ') { %w[y n].include?(@option.downcase) }
      @app.create_new_student(@age, @name, @permission)
    else
      @specialization = check_input('Specialization: ') { @option != '' }
      @app.create_new_teacher(@specialization, @age, @name)
    end
    puts 'Person created successfully'
  end
end
