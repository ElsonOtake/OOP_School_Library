require './check_input'

class AllRentals
  include CheckInput

  def initialize(app)
    @app = app
    @option = ''
    @book = ''
    @person = ''
    @date = ''
    @id = ''
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
  end

  def create_a_rental
    puts 'The book list is empty!' if @app.list_books.length.zero?
    puts 'The people list is empty!' if @app.list_people.length.zero?
    return unless !@app.list_books.length.zero? && !@app.list_people.length.zero?

    @book = list_rental_books
    puts
    @person = list_rental_people
    puts
    @date = check_input('Date: YYYY/MM/DD ') do
      @option.match?(%r{^(19|20)\d\d/(0[1-9]|1[012])/(0[1-9]|[1-2][0-9]|3[0-1])$})
    end
    @app.create_new_rental(@app.list_people[@person.to_i], @app.list_books[@book.to_i], @date)
    puts 'Rental created successfully'
  end

  def list_all_rentals
    @id = check_input('Id of person: ') { @option.match?(/^\d+$/) }
    puts 'Rentals:'
    puts 'The rental list is empty!' if @app.list_rentals_by_id(@id.to_i).length.zero?
    @app.list_rentals_by_id(@id.to_i).each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end
