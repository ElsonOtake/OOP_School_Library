require './check_input'

class AllBooks
  include CheckInput

  def initialize (app)
    @app = app
    @title = ''
    @author = ''
  end

  def list_all_books
    puts 'The book list is empty!' if @app.list_books.length.zero?
    @app.list_books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def create_a_book
    @title = check_input('Title: ') { @option != '' }
    @author = check_input('Author: ') { @option != '' }
    @app.create_new_book(@title, @author)
    puts 'Book created successfully'
  end

end
