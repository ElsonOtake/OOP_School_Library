require './app'

class Main
  def initialize
    @app = App.new
    @option = ''
    @type = ''
    @age = ''
    @name = ''
    @permission = ''
    @specialization = ''
    @title = ''
    @author = ''
    @book = ''
    @person = ''
    @date = ''
    @id = ''
  end

  def menu_content
    puts
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def menu
    menu_content
    @option = check_input('') { %w[1 2 3 4 5 6 7].include?(@option) }
  end

  def list_all_books
    @app.list_books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
    puts
  end

  def list_all_people
    @app.list_people.each do |people|
      puts "[#{people.class}] Name: #{people.name}, ID: #{people.id}, Age: #{people.age}"
    end
    puts
  end

  def check_input(str)
    loop do
      print str
      @option = gets.chomp.strip
      break if yield
    end
    @option
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
    puts
  end

  def create_a_book
    @title = check_input('Title: ') { @option != '' }
    @author = check_input('Author: ') { @option != '' }
    @app.create_new_book(@title, @author)
    puts 'Book created successfully'
    puts
  end

  def select_book
    puts 'Select a book from the following list by number'
    @app.list_books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_rental_books
    select_book
    list_size = @app.list_books.length
    @option = check_input('') { @option.match?(/^\d+$/) && (0..list_size - 1).any? { |a| a == @option.to_i } }
    puts
    @option
  end

  def select_people
    puts 'Select a person from the following list by number (not id)'
    @app.list_people.each_with_index do |people, index|
      puts "#{index}) [#{people.class}] Name: #{people.name}, ID: #{people.id}, Age: #{people.age}"
    end
  end

  def list_rental_people
    select_people
    list_size = @app.list_people.length
    @option = check_input('') { @option.match?(/^\d+$/) && (0..list_size - 1).any? { |a| a == @option.to_i } }
    puts
    @option
  end

  def create_a_rental
    @book = list_rental_books
    @person = list_rental_people
    @date = check_input('Date: YYYY/MM/DD ') do
      @option.match?(%r{^(19|20)\d\d/(0[1-9]|1[012])/(0[1-9]|[1-2][0-9]|3[0-1])$})
    end
    @app.create_new_rental(@app.list_people[@person.to_i], @app.list_books[@book.to_i], @date)
    puts 'Rental created successfully'
    puts
  end

  def list_all_rentals
    @id = check_input('Id of person: ') { @option.match?(/^\d+$/) }
    puts 'Rentals:'
    list_id = @app.list_rentals.select { |rental| rental.person.id == @id.to_i }
    list_id.each { |rental| puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" }
    puts
  end

  def start_main
    loop do
      @option = menu
      case @option
      when '1'
        list_all_books
      when '2'
        list_all_people
      when '3'
        create_a_person
      when '4'
        create_a_book
      when '5'
        create_a_rental
      when '6'
        list_all_rentals
      else
        puts 'Thank you for using this app!'
        break
      end
    end
  end
end

puts 'Welcome to School Library App!'
main = Main.new
main.start_main
