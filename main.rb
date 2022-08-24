require './app'

class Main
  def initialize
    @app = App.new
    @option = ""
    @age = ""
    @name = ""
    @permission = ""
    @specialization = ""
    @title = ""
    @author = ""
    @book = ""
    @person = ""
    @date = ""
    @id = ""
  end

  def menu
    puts 'Welcome to School Library App!'
    puts
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    loop do
      @option = gets.chomp.strip
      break if %w[1 2 3 4 5 6 7].include?(@option)
    end
    @option
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

  def create_a_person
    loop do
      print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
      @option = gets.chomp.strip
      break if %w[1 2].include?(@option)
    end
    loop do
      print 'Age: '
      @age = gets.chomp.strip
      break if @age.match?(/^\d+$/)
    end
    loop do
      print 'Name: '
      @name = gets.chomp.strip
      break if @name != ''
    end
    if @option == '1'
      loop do
        print 'Has parent permission? [Y/N]: '
        @permission = gets.chomp.strip
        break if %w[y n].include?(@permission.downcase)
      end
    else
      loop do
        print 'Specialization: '
        @specialization = gets.chomp.strip
        break if @specialization != ''
      end
    end
    @app.create_new_student(@age, @name, @permission) if @option == '1'
    @app.create_new_teacher(@specialization, @age, @name) if @option == '2'
    puts 'Person created successfully'
    puts
  end

  def create_a_book
    loop do
      print 'Title: '
      @title = gets.chomp.strip
      break if @title != ''
    end
    loop do
      print 'Author: '
      @author = gets.chomp.strip
      break if @author != ''
    end
    @app.create_new_book(@title, @author)
    puts 'Book created successfully'
    puts
  end

  def create_a_rental
    puts 'Select a book from the following list by number'
    @app.list_books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    loop do
      list_size = @app.list_books.length
      @book = gets.chomp.strip
      break if @book.match?(/^\d+$/) && (0..list_size - 1).any? { |a| a == @book.to_i }
    end
    puts
    puts 'Select a person from the following list by number (not id)'
    @app.list_people.each_with_index do |people, index|
      puts "#{index}) [#{people.class}] Name: #{people.name}, ID: #{people.id}, Age: #{people.age}"
    end
    loop do
      list_size = @app.list_people.length
      @person = gets.chomp.strip
      break if @person.match?(/^\d+$/) && (0..list_size - 1).any? { |a| a == @person.to_i }
    end
    puts
    loop do
      print 'Date: YYYY/MM/DD '
      @date = gets.chomp.strip
      break if @date.match?(%r{^(19|20)\d\d/(0[1-9]|1[012])/(0[1-9]|[1-2][0-9]|3[0-1])$})
    end
    @app.create_new_rental(@app.list_people[@person.to_i], @app.list_books[@book.to_i], @date)
    puts 'Rental created successfully'
    puts
  end

  def list_all_rentals
    loop do
      print 'Id of person: '
      @id = gets.chomp.strip
      break if @id.match?(/^\d+$/)
    end
    puts "Rentals:"
    list_id = @app.list_rentals.select { |rental| rental.person.id == @id.to_i }
    list_id.each { |rental| puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" }
    puts
  end

  def start_main
    loop do
      option = menu
      case option
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
      end
      break if option == '7'
    end
  end
end

main = Main.new
main.start_main
