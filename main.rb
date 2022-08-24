require './app'

class Main

  def initialize
    @app = App.new
  end

  def menu
    puts "Welcome to School Library App!"
    puts
    puts "Please choose an option by entering a number:"
    puts "1 - List all books"
    puts "2 - List all people"
    puts "3 - Create a person"
    puts "4 - Create a book"
    puts "5 - Create a rental"
    puts "6 - List all rentals for a given person id"
    puts "7 - Exit"
    begin
      option = gets.chomp.strip
    end until %w(1 2 3 4 5 6 7).include?(option)
    option
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
    begin
      print "Do you want to create a student (1) or a teacher (2)? [Input the number]: "
      option = gets.chomp.strip
    end until %w(1 2).include?(option)
    begin
      print "Age: "
      age = gets.chomp.strip
    end until age.match?(/^\d+$/)
    begin
      print "Name: "
      name = gets.chomp.strip
    end until name != ""
    if option == "1"
      begin
        print "Has parent permission? [Y/N]: "
        permission = gets.chomp.strip
      end until %w(y n).include?(permission.downcase)
    else
      begin
        print "Specialization: "
        specialization = gets.chomp.strip
      end until specialization != ""
    end
    @app.create_new_student(age, name, permission) if option == "1"
    @app.create_new_teacher(specialization, age, name) if option == "2"
    puts "Person created successfully"
    puts
  end

  def create_a_book
    begin
      print "Title: "
      title = gets.chomp.strip
    end until title != ""
    begin
      print "Author: "
      author = gets.chomp.strip
    end until author != ""
    @app.create_new_book(title, author)
    puts "Book created successfully"
    puts
  end

  def create_a_rental
    puts "Select a book from the following list by number"
    @app.list_books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    begin
      list_size = @app.list_books.length
      book = gets.chomp.strip
    end until book.match?(/^\d+$/) && (0..list_size - 1).any? { |a| a == book.to_i}
    puts
    puts "Select a person from the following list by number (not id)"
    @app.list_people.each_with_index do |people, index|
      puts "#{index}) [#{people.class}] Name: #{people.name}, ID: #{people.id}, Age: #{people.age}"
    end
    begin
      list_size = @app.list_people.length
      person = gets.chomp.strip
    end until person.match?(/^\d+$/) && (0..list_size - 1).any? { |a| a == person.to_i}
    puts
    begin
      print "Date: yyyy/mm/dd "
      date = gets.chomp.strip
    end until date.match?(/^(19|20)\d\d\/(0[1-9]|1[012])\/(0[1-9]|[1-2][0-9]|3[0-1])$/)
    @app.create_new_rental(@app.list_people[person], @app.list_books[book], date)
    puts "Rental created successfully"
    puts
  end

  def list_all_rentals
    begin
      print "Id of person: "
      id = gets.chomp.strip
    end until id.match?(/^\d+$/)
    puts "Rentals: #{id}"
    puts "Date: 2020/05/04, Book \"Lord of the rings\" by Tolkien"
    puts "Date: 2021/06/10, Book \"Game of thrones\" by George martin"
    puts
  end

  def start_main
    begin
      option = menu
      case option
      when "1"
        list_all_books
      when "2"
        list_all_people
      when "3"
        create_a_person
      when "4"
        create_a_book
      when "5"
        create_a_rental
      when "6"
        list_all_rentals
      else
        puts "Thank you for using this app!"
      end
    end until option == "7"
  end
end

main = Main.new
main.start_main
